import std.stdio;
import derelict.sdl2.sdl;
void main()
{
	SDL_Window* window = null;
	SDL_Surface* screenSurface = null;

	if(SDL_Init(SDL_INIT_VIDEO) < 0){
		writeln("need to init");
	}

	writeln("END");
}
