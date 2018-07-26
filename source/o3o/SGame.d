//
// o3o runtime / SGame.d
//   - 게임루프 등등 게임의 큰 틀을 담당하는 서비스
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.SGame;
import std.stdio;
import std.string;

import o3o.Xdl;
import o3o.SEvent;
import o3o.ULog;
import o3o.UConfig;
import derelict.sdl2.sdl;

/**
 * SGame 클래스
 *   - 게임루프 등등 게임의 큰 틀을 담당하는 서비스
 */
class SGame{
    //SDL_Window*   window;
    //SDL_Renderer* renderer;
    private XDLScreen oScreen;
    private SEvent srvcEvent;
    
    private SDL_Event oEvent;

    /// 생성자
    this(){
        // 옵션파일 읽어오기
        //   - title: 게임타이틀
        //   - x    : 게임창 가로 값
        //   - y    : 게임창 세로 값
        //UConfig cfg = new UConfig("SGame.cfg");

        // 게임 초기화
        XDL_Init();

        // 게임 창 만들기
        //this.window = XDL_CreateWindow(new UConfig("SGame.cfg"), SDL_WINDOW_SHOWN);
        // 게임 렌더러 만들기
        //this.renderer = XDL_CreateRenderer(this.window);

        // 오브젝트로 게임 스크린(창/렌더러) 생성
        this.oScreen = new XDLScreen(
            new UConfig("SGame.cfg")
        );

        // 이벤트 서비스
        this.srvcEvent = new SEvent(
            this.oScreen
        );
    }

    /**
     * 컴포넌트 모두 업데이트
     *   - 선언된 주요 컴포넌트들을 모두 업데이트 한다.
     *   - 업데이트의 우선순위에 주의하도록 한다.
     */
    void update(){
        // 이벤트 업데이트
        this.srvcEvent.update(oEvent);
    }

    // 게임 시작
    void run(){
        // 디버그 메세지
        debug{
            ulog("Game Service: start");
        }

        // 게임 루프시작
        while(!this.oScreen.isExit()){
            // 게임서비스 구동 시작
            this.update();
        }
    }

    /// 소멸자
    ~this(){
        //this.window = null;
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