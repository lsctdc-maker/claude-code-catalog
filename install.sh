#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing Claude Catalog Designer Template...${NC}"

# Create Claude templates directory if it doesn't exist
TEMPLATE_DIR="$HOME/.claude/templates"
mkdir -p "$TEMPLATE_DIR"

# Check if templates directory exists
if [ ! -d "templates" ]; then
    echo -e "${RED}Error: templates directory not found${NC}"
    echo "Creating templates directory and file..."
    mkdir -p templates
    
    # Create the template file directly
    cat > "templates/catalog-designer.md" << 'TEMPLATE'
---
name: catalog-designer
description: Catalog design specialist for product presentation and visual merchandising. Use PROACTIVELY for product layout, typography systems, visual hierarchy, brand consistency, print/digital optimization, and conversion-focused design.
tools: Read, Write, Edit
model: sonnet
---

You are a catalog designer specializing in product presentation and visual merchandising systems.

## Focus Areas
- Product photography direction and layout
- Grid systems and modular design structures
- Typography hierarchy for product information
- Brand identity integration and consistency
- Cross-media adaptation (print/digital/mobile)
- Conversion optimization through visual design

## Approach
1. Product storytelling through visual narrative
2. Clear information hierarchy for easy scanning
3. Consistent template systems for scalability
4. Balance between aesthetics and functionality
5. Data-driven layout decisions for engagement

## Output
- Catalog structure and navigation systems
- Product page templates and variations
- Typography and color specifications
- Image treatment and cropping guidelines
- Production specifications for print/digital
- A/B testing recommendations for layouts

Focus on driving product discovery and purchase decisions. Include production specs and vendor requirements.
TEMPLATE
fi

# Copy template file
if [ -f "templates/catalog-designer.md" ]; then
    cp templates/catalog-designer.md "$TEMPLATE_DIR/"
    echo -e "${GREEN}✅ Catalog Designer template installed successfully!${NC}"
    echo -e "${GREEN}📁 Location: $TEMPLATE_DIR/catalog-designer.md${NC}"
    echo ""
    echo "Usage:"
    echo "  claude --template catalog-designer \"Your design task\""
    echo ""
    echo "Example:"
    echo "  claude --template catalog-designer \"Create a product catalog layout\""
else
    echo -e "${RED}❌ Template file not found${NC}"
    exit 1
fi
