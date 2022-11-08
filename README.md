# PokemonTestApp

App's highlights:

    - created using MVP approach
    - pods used during development:
    
        - SnapKit and Then to easily create app's interface programmatically
        - Kingfisher to handle downloading images via URLs, caching and offering placeholders
        - Alamofire for a powerful network layer
        - SwiftEntryKit for custom pop-ups to notify users of network errors
    
    - unit testing is available thanks to protocols and dependency injections
    - shimmer animation is used when network connection is absent and data cannot be fetched
    - list of Pokemon can be refreshed at any time via RefreshControl
