
//          Copyright 2018 - 2022 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.sdl.bind.sdlkeyboard;

import bindbc.sdl.config;
import bindbc.sdl.bind.sdlkeycode : SDL_Keycode, SDL_Keymod;
import bindbc.sdl.bind.sdlrect : SDL_Rect;
import bindbc.sdl.bind.sdlscancode : SDL_Scancode;
import bindbc.sdl.bind.sdlstdinc : SDL_bool;
import bindbc.sdl.bind.sdlvideo : SDL_Window;

struct SDL_Keysym {
    SDL_Scancode scancode;
    SDL_Keycode sym;
    ushort mod;
    uint unused;
}

static if(staticBinding) {
    extern(C) @nogc nothrow {
        SDL_Window* SDL_GetKeyboardFocus();
        ubyte* SDL_GetKeyboardState(int* numkeys);
        SDL_Keymod SDL_GetModState();
        void SDL_SetModState(SDL_Keymod modstate);
        SDL_Keycode SDL_GetKeyFromScancode(SDL_Scancode scancode);
        SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode key);
        const(char)* SDL_GetScancodeName(SDL_Scancode scancode);
        SDL_Scancode SDL_GetScancodeFromName(const(char)* name);
        const(char)* SDL_GetKeyName(SDL_Keycode key);
        SDL_Keycode SDL_GetKeyFromName(const(char)* name);
        void SDL_StartTextInput();
        SDL_bool SDL_IsTextInputActive();
        void SDL_StopTextInput();
        void SDL_SetTextInputRect(SDL_Rect*);
        SDL_bool SDL_HasScreenKeyboardSupport();
        SDL_bool SDL_IsScreenKeyboardShown(SDL_Window* window);

        static if(sdlSupport == SDLSupport.sdl2022) {
            void SDL_ClearComposition();
            SDL_bool SDL_IsTextInputShown();
        }
    }
}
else {
    extern(C) @nogc nothrow {
        alias pSDL_GetKeyboardFocus = SDL_Window* function();
        alias pSDL_GetKeyboardState = ubyte* function(int* numkeys);
        alias pSDL_GetModState = SDL_Keymod function();
        alias pSDL_SetModState = void function(SDL_Keymod modstate);
        alias pSDL_GetKeyFromScancode = SDL_Keycode function(SDL_Scancode scancode);
        alias pSDL_GetScancodeFromKey = SDL_Scancode function(SDL_Keycode key);
        alias pSDL_GetScancodeName = const(char)* function(SDL_Scancode scancode);
        alias pSDL_GetScancodeFromName = SDL_Scancode function(const(char)* name);
        alias pSDL_GetKeyName = const(char)* function(SDL_Keycode key);
        alias pSDL_GetKeyFromName = SDL_Keycode function(const(char)* name);
        alias pSDL_StartTextInput = void function();
        alias pSDL_IsTextInputActive = SDL_bool function();
        alias pSDL_StopTextInput = void function();
        alias pSDL_SetTextInputRect = void function(SDL_Rect*);
        alias pSDL_HasScreenKeyboardSupport = SDL_bool function();
        alias pSDL_IsScreenKeyboardShown = SDL_bool function(SDL_Window* window);
    }

    __gshared {
        pSDL_GetKeyboardFocus SDL_GetKeyboardFocus;
        pSDL_GetKeyboardState SDL_GetKeyboardState;
        pSDL_GetModState SDL_GetModState;
        pSDL_SetModState SDL_SetModState;
        pSDL_GetKeyFromScancode SDL_GetKeyFromScancode;
        pSDL_GetScancodeFromKey SDL_GetScancodeFromKey;
        pSDL_GetScancodeName SDL_GetScancodeName;
        pSDL_GetScancodeFromName SDL_GetScancodeFromName;
        pSDL_GetKeyName SDL_GetKeyName;
        pSDL_GetKeyFromName SDL_GetKeyFromName;
        pSDL_StartTextInput SDL_StartTextInput;
        pSDL_IsTextInputActive SDL_IsTextInputActive;
        pSDL_StopTextInput SDL_StopTextInput;
        pSDL_SetTextInputRect SDL_SetTextInputRect;
        pSDL_HasScreenKeyboardSupport SDL_HasScreenKeyboardSupport;
        pSDL_IsScreenKeyboardShown SDL_IsScreenKeyboardShown;
    }

    static if(sdlSupport >= SDLSupport.sdl2022) {
        extern(C) @nogc nothrow {
            alias pSDL_ClearComposition = void function();
            alias pSDL_IsTextInputShown = SDL_bool function();
        }

        __gshared {
            pSDL_ClearComposition SDL_ClearComposition;
            pSDL_IsTextInputShown SDL_IsTextInputShown;
        }
    }
}
