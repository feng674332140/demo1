import com.yzt.zhmp.beans.Cdistrict;
import com.yzt.zhmp.beans.Feedback;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.service.SystemService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Test01 {
    @Autowired
    private CollectionSystemService collectionSystemService;

    @Autowired
    private SystemService systemService;

    @Test
    public void demo(){
        Cdistrict cdistrict=new Cdistrict("330702","1","磐安县","介绍","不错","名胜古迹","投诉","很好","330700");
        int i=collectionSystemService.addCountyInfo(cdistrict);
        System.out.println(i);
    }

    @Test
    public void addFeedbackTest(){
        Feedback feedback = new Feedback();
        feedback.setUsername("张三");
        feedback.setDeptid(111);
        feedback.setDescription("附近路灯不亮");
        systemService.addFeedback(feedback);
    }
}
