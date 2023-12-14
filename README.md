# flutter_base

A base project for flutter

# Getting Started


# Project architecture
```
- /app  
    - /data
        - /services
          - service.dart
        - /model
          - model.dart
        - /provider
          - provider.dart
    - /modules
        - /name_module
            - page.dart
            - controller.dart
            - binding.dart
            - repository.dart
            - /widgets
              - reusable_module_widget.dart
    - /global_widgets 
      - reusable_global_widget.dart
- /routes
    - my_routes.dart
    - my_pages.dart
- /core
    - /theme
        - text_theme.dart   
        - app_theme.dart  
    - /utils
        - /keys
        - /helpers
    - /values
        - /strings
        - /colors
- main.dart  
```
To create new module:

To create new model:



# Generate Object box database
run command: 
<code>flutter pub run build_runner build</code>

# Access ObjectBox Admin
forward port for admin database:
<code>adb forward tcp:8090 tcp:8090</code>
open browser: http://127.0.0.1:8090/index.html