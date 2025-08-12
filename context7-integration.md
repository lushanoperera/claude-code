# Context7 MCP Integration Guide

## 🔌 Overview

Context7 is an integrated MCP (Model Context Protocol) service that provides real-time technical documentation and code examples for any library. It serves as the primary source for up-to-date technical information in Claude Code.

## 📡 Configuration

### Endpoint
```
https://mcp.context7.com/mcp
```

### Integration Type
- **Protocol**: MCP (Model Context Protocol)
- **Service**: Context7
- **Priority**: Primary source for technical documentation

## 🛠️ Available Functions

### 1. `resolve-library-id`

**Purpose**: Resolves a package/product name to a Context7-compatible library ID

**Parameters**:
```typescript
{
  libraryName: string  // Library name to search for
}
```

**Usage Example**:
```bash
# Search for React library
mcp__context7__resolve-library-id("react")

# Returns matching libraries with IDs like:
# /facebook/react
# /facebook/react/v18.2.0
```

**Selection Criteria**:
- Name similarity (exact matches prioritized)
- Description relevance
- Documentation coverage (higher Code Snippet counts)
- Trust score (7-10 considered authoritative)

### 2. `get-library-docs`

**Purpose**: Fetches up-to-date documentation for a specific library

**Parameters**:
```typescript
{
  context7CompatibleLibraryID: string,  // Required: exact library ID
  tokens?: number,                      // Optional: max tokens (default: 10000)
  topic?: string                        // Optional: focus topic
}
```

**Usage Example**:
```bash
# Get Next.js documentation
mcp__context7__get-library-docs("/vercel/next.js")

# Get Vue hooks documentation
mcp__context7__get-library-docs("/vuejs/core", topic="hooks")

# Get detailed Laravel docs
mcp__context7__get-library-docs("/laravel/framework", tokens=20000)
```

## 📚 Common Library IDs

### Frontend Frameworks
- `/facebook/react` - React
- `/vercel/next.js` - Next.js
- `/vuejs/core` - Vue.js
- `/angular/angular` - Angular
- `/sveltejs/svelte` - Svelte

### Backend Frameworks
- `/laravel/framework` - Laravel
- `/symfony/symfony` - Symfony
- `/expressjs/express` - Express.js
- `/nestjs/nest` - NestJS
- `/django/django` - Django

### Databases & ORMs
- `/mongodb/docs` - MongoDB
- `/prisma/prisma` - Prisma ORM
- `/typeorm/typeorm` - TypeORM
- `/sequelize/sequelize` - Sequelize
- `/knex/knex` - Knex.js

### Cloud & Infrastructure
- `/supabase/supabase` - Supabase
- `/firebase/firebase-js-sdk` - Firebase
- `/aws/aws-sdk-js` - AWS SDK
- `/vercel/vercel` - Vercel Platform
- `/docker/docs` - Docker

### UI Libraries
- `/tailwindlabs/tailwindcss` - Tailwind CSS
- `/mui/material-ui` - Material-UI
- `/ant-design/ant-design` - Ant Design
- `/chakra-ui/chakra-ui` - Chakra UI
- `/bootstrap/bootstrap` - Bootstrap

## 🔄 Workflow Integration

### Standard Workflow

1. **User requests information about a library**
   ```
   User: "How do I use React hooks?"
   ```

2. **Resolve library ID** (if not provided)
   ```typescript
   resolve-library-id("react")
   // Returns: /facebook/react
   ```

3. **Fetch documentation**
   ```typescript
   get-library-docs("/facebook/react", topic="hooks")
   ```

4. **Process and present information**
   - Extract relevant sections
   - Provide code examples
   - Explain concepts

### Direct ID Usage

When users provide exact library IDs:
```
User: "Get docs for /vercel/next.js/v14.3.0-canary.87"
```

Skip resolution and directly fetch:
```typescript
get-library-docs("/vercel/next.js/v14.3.0-canary.87")
```

## 🎯 Best Practices

### 1. Token Management
- Default: 10,000 tokens (sufficient for most queries)
- Increase for comprehensive documentation: 15,000-20,000
- Decrease for specific topics: 5,000-7,500

### 2. Topic Focusing
Use the `topic` parameter for targeted documentation:
- `"routing"` for routing information
- `"hooks"` for React hooks
- `"authentication"` for auth systems
- `"api"` for API documentation

### 3. Version Specificity
When version matters, use versioned IDs:
```typescript
// Specific version
get-library-docs("/react/react/v18.2.0")

// Latest version
get-library-docs("/react/react")
```

### 4. Fallback Strategy
```typescript
try {
  // Try Context7 first
  const docs = await get-library-docs(libraryId)
  return docs
} catch (error) {
  // Fallback to standard knowledge base
  return getFromKnowledgeBase(library)
}
```

## 🔍 Search Strategies

### Broad Search
```typescript
// Search for general term
resolve-library-id("database")
// Returns multiple matches: MongoDB, PostgreSQL, MySQL, etc.
```

### Specific Search
```typescript
// Search for exact library
resolve-library-id("@mui/material")
// Returns exact match: /mui/material-ui
```

### Framework Ecosystem
```typescript
// Search within ecosystem
resolve-library-id("vue router")
// Returns: /vuejs/router
```

## 📊 Response Processing

### Documentation Structure
```typescript
interface Context7Response {
  library: {
    id: string
    name: string
    version: string
    trustScore: number
  }
  documentation: {
    overview: string
    apiReference: APISection[]
    codeExamples: CodeExample[]
    guides: Guide[]
  }
}
```

### Example Processing
```typescript
function processContext7Docs(response: Context7Response) {
  // Extract relevant sections
  const { codeExamples, apiReference } = response.documentation
  
  // Filter by relevance
  const relevant = codeExamples.filter(ex => 
    ex.tags.includes(userQuery.topic)
  )
  
  // Format for presentation
  return formatDocumentation(relevant)
}
```

## 🚨 Error Handling

### Common Errors

1. **Library Not Found**
   ```typescript
   if (error.code === 'LIBRARY_NOT_FOUND') {
     // Suggest alternatives or use fuzzy search
     const suggestions = await getSimilarLibraries(query)
   }
   ```

2. **Rate Limiting**
   ```typescript
   if (error.code === 'RATE_LIMIT') {
     // Wait and retry or use cached data
     await delay(1000)
     return getCachedDocs(libraryId)
   }
   ```

3. **Network Issues**
   ```typescript
   if (error.code === 'NETWORK_ERROR') {
     // Fallback to offline documentation
     return getOfflineDocs(library)
   }
   ```

## 🔧 Advanced Usage

### Multi-Library Documentation
```typescript
// Compare multiple libraries
const libraries = [
  '/facebook/react',
  '/vuejs/core',
  '/angular/angular'
]

const docs = await Promise.all(
  libraries.map(id => get-library-docs(id, tokens=5000))
)
```

### Incremental Documentation
```typescript
// Start with overview
const overview = await get-library-docs(id, tokens=3000)

// Get detailed info on demand
if (userNeedsMore) {
  const detailed = await get-library-docs(id, 
    tokens=15000, 
    topic=specificTopic
  )
}
```

### Caching Strategy
```typescript
const docCache = new Map()

async function getCachedDocs(libraryId: string) {
  if (docCache.has(libraryId)) {
    const cached = docCache.get(libraryId)
    if (Date.now() - cached.timestamp < 3600000) { // 1 hour
      return cached.docs
    }
  }
  
  const docs = await get-library-docs(libraryId)
  docCache.set(libraryId, {
    docs,
    timestamp: Date.now()
  })
  return docs
}
```

## 📈 Performance Optimization

### 1. Batch Requests
When multiple libraries are needed:
```typescript
// Parallel fetching
const [reactDocs, nextDocs] = await Promise.all([
  get-library-docs('/facebook/react'),
  get-library-docs('/vercel/next.js')
])
```

### 2. Progressive Loading
```typescript
// Quick response with basic info
const quick = await get-library-docs(id, tokens=2000)
showInitialResponse(quick)

// Load comprehensive docs in background
const full = await get-library-docs(id, tokens=15000)
updateWithFullDocs(full)
```

### 3. Smart Caching
- Cache frequently requested libraries
- Invalidate cache after 24 hours
- Store version-specific docs permanently

## 🎓 Integration Benefits

1. **Real-time Updates**: Always current documentation
2. **Version Awareness**: Access to specific versions
3. **Comprehensive Coverage**: Wide library ecosystem
4. **Intelligent Search**: Smart library resolution
5. **Performance**: Optimized token usage
6. **Reliability**: Fallback mechanisms

## 🔗 Related Documentation

- [MCP Protocol Specification](https://modelcontextprotocol.io)
- [Context7 Service](https://context7.com)
- [Claude Code MCP Integration](https://docs.anthropic.com/claude-code/mcp)