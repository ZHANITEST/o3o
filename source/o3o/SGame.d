//
// o3o runtime / SGame.d
//   - 게임루프 등등 게임의 큰 틀을 담당하는 서비스
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.SGame;
import std.stdio;

import o3o.UConfig;

import derelict.sdl2.sdl;

/**
 * SGame 클래스
 *   - 게임루프 등등 게임의 큰 틀을 담당하는 서비스
 */
class SGame{
    SDL_Window* window;

    this(){
/*
window = SDL_CreateWindow(
"Hello SDL",
SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,
640,480,
0);*/


    }

    // 컨테이너 업데이트
    void update(){

    }

    // 게임 시작
    void run(){

    }
}

/**
 * 지옥의 테스트케이스
 */
unittest{
    writeln("[Unittest] SGame - START");

    // SDL 초기화는 제대로 됨?
    assert(SDL_Init(SDL_INIT_VIDEO)==0);
    writeln("1 pass");

    // SGame클래스에서 쓸 설정파일은 읽어짐?
    assert( new UConfig("SGame.cfg") );
    UConfig test_cfg = new UConfig("SGame.cfg");
    writeln("2 pass");


    writeln("[Unittest] SGame - END");
}