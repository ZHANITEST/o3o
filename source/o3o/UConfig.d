//
// o3o runtime / UConfig.d
//   - 설정 유틸리티
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//   - json editor: https://jsoneditoronline.org
//

module o3o.UConfig;
import std.stdio;
import std.file;
import std.json;
import std.conv;

import o3o.ULog;

/// 설정파일의 경로는 '게임디렉토리/cfg'로 고정
immutable string IM_CFG_PATH = "./cfg/";

/**
 * UConfig 클래스
 */
class UConfig{
    private JSONValue o; /// JSON 오브젝트
    /**
     * 생성자
     * description:
     * params:
     *   name = 불러 올 설정파일(*.cfg) 이름(ex. name.cfg). 못 찾으면 예외발생.
     */
    this(string name){
        /// 게임을 시작과 동시에 설정파일을 읽어와야 하므로
        /// 설정파일을 찾을 수 없다면 게임시스템을 강제로 종료해야 한다.
        
        // 설정파일명
        string fname = IM_CFG_PATH~name;

        // 설정파일은 반드시 '파일'이어야 하고 '존재'해야 한다.
        if(exists(fname) && isFile(fname)){
            // 파일을 불러와 string으로 담기
            string cfg_body;
            cfg_body = readText(fname);

            // ----- 담은 string을 가지고 파싱 시도
            try{
                this.o = parseJSON(cfg_body);
            }
            // ----- 파싱하려다 실패 시
            catch (JSONException e)
            {
                // 릴리즈든 디버그든 Exception 발생으로 일단 종료
                writeln("UConfig(JSON LOAD): [Fail] -> ", e.msg);
                
                // 디버그용: 파싱하려던 값 출력
                debug{
                    ulog("\tpath => "~fname);
                    ulog("\tbody => "~cfg_body);
                }
            }
            // 디버그용 성공메세지
            debug{
                ulog("Config(Init): [Done]"~fname);
            }
        }
        // 없을 경우 로그 찍고 종료
        else{
            // 디버그용 실패메세지
            debug{
                ulog("Config(Init): [Fail]"~fname);
            }
        }
    }

    /**
     * key로 단일 얻어오기
     * description:
     *   리턴 값은 반드시 string으로.
     *
     * params:
     *   key = 불러 올 설정 value의 key. 못 찾을 경우 "N/A"문자열 리턴.
     */
    string g(string key){
        // JSON 쿼리 날리기(무조건 str으로)
        return o[key].str;
    }

    /**
     * key로 int얻어오기
     * description:
     *   리턴 값은 반드시 string으로.
     *
     * params:
     *   key = 불러 올 설정 value의 key. 못 찾을 경우 "N/A"문자열 리턴.
     */
    int getInt(string key){
        // JSON 쿼리 날리기(무조건 str으로)
        return to!int(o[key].str);
    }
}

/**
 * 지옥의 테스트케이스
 */
unittest{
    writeln("[Unittest] UConfig - START");

    // ./cfg/UConfig 파일은 제대로 읽혀지나?
    // 내용: ({ "TEST":"CASE" })
    UConfig c = new UConfig("UConfig.cfg");

    // 파싱은 제대로 처리되나?
    assert(c.g("TEST")  ==  "CASE",
        c.g("TEST")~"=="~"CASE"
    );
    
    writeln("[Unittest] UConfig - END");
}