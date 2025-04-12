#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <time.h>
#include <stdio.h>

#define FONT_PATH "/usr/share/fonts/TTF/DejaVuSans.ttf"
#define API_CMD "curl -s \"http://api.openweathermap.org/data/2.5/weather?q=Boulder&units=imperial&appid=YOUR_KEY\" | grep -o '\"temp\":[0-9.]*' | head -n1"

static void render_text(SDL_Renderer *r, TTF_Font *f, const char *msg, int y)
{
    SDL_Color white = {255,255,255,255};
    SDL_Surface *s = TTF_RenderUTF8_Blended(f, msg, white);
    SDL_Texture *t = SDL_CreateTextureFromSurface(r, s);
    int w,h; SDL_QueryTexture(t, NULL, NULL, &w, &h);
    SDL_Rect dst = { (1280-w)/2, y, w, h };
    SDL_RenderCopy(r, t, NULL, &dst);
    SDL_FreeSurface(s);
    SDL_DestroyTexture(t);
}

int main()
{
    printf("Step 1\n");
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL error: %s\n", SDL_GetError());
        return 1;
    }
    
    printf("Step 2\n");
    if (TTF_Init() == -1) {
        fprintf(stderr, "TTF error: %s\n", TTF_GetError());
        return 1;
    }
    
    printf("Step 3\n");
    TTF_Font *font = TTF_OpenFont("/usr/share/fonts/TTF/DejaVuSans.ttf", 48);
    if (!font) {
        fprintf(stderr, "Font open error: %s\n", TTF_GetError());
        return 1;
    }
    
    printf("Step 4\n");
    SDL_Window   *win = SDL_CreateWindow("SmartClock",
                            SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                            800, 480, SDL_WINDOW_FULLSCREEN);

    SDL_Renderer *ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED);
    
    printf("Step 5\n");

    char temp[32] = "temp:N/A";
    FILE *fp = popen(API_CMD, "r");
    if (fp && fgets(temp, sizeof temp, fp)) temp[strcspn(temp,"\n")]=0;
    if (fp) pclose(fp);

    while (1) {
        SDL_Event e; while (SDL_PollEvent(&e)) if (e.type==SDL_KEYDOWN) goto quit;

        time_t now = time(NULL);
        struct tm tm; localtime_r(&now,&tm);
        char ts[64]; strftime(ts,sizeof ts,"%Y-%m-%d %H:%M:%S",&tm);

        SDL_SetRenderDrawColor(ren,0,0,0,255);
        SDL_RenderClear(ren);
        render_text(ren,font,ts,200);
        render_text(ren,font,temp,300);
        SDL_RenderPresent(ren);
        SDL_Delay(1000);
    }
quit:
    SDL_Quit(); return 0;
}

