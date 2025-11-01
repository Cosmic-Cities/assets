# Cosmic Cities Assets

This repository contains the assets for the Cosmic Cities game project.

## Structure

- `animsprites/` - Animation sprite source files
- `fonts/` - Font files
- `icons/` - Application icons
- `locales/` - Localization files
- `maps/` - Tilemap files
- `sounds/` - Audio files (music and sound effects)
- `sprites/` - Sprite images

## Asset Configuration

The `project.hxp` file configures how these assets are included in the game build. This file uses HXP (Haxe Project) format instead of XML for better organization and maintainability.

### Usage

This assets repository can be integrated into a Haxe/Lime project by:

1. Including this repository as a submodule or dependency
2. Referencing the `project.hxp` file in your main project configuration
3. The assets will be automatically included based on the configuration

### Excluded Files

The following patterns are excluded from the asset build:
- Hidden files (.*) 
- CVS directories
- System files (thumbs.db, desktop.ini)
- Source files (*.ase, *.md)
- Git files

## Locales

The project supports multiple locales including:
- en-US (English - United States)
- en-GB (English - United Kingdom)
- pt-PT (Portuguese - Portugal)
- pt-BR (Portuguese - Brazil)
- es-ES (Spanish - Spain)
- fr-FR (French - France)
- de-DE (German - Germany)
- ja-JP (Japanese - Japan)
- ko-KR (Korean - Korea)
- zh-CN (Chinese - China)
- ru-RU (Russian - Russia)

Configuration for locales is managed through `locales/index.xml`.
