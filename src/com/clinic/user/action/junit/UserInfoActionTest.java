package com.clinic.user.action.junit;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
// 注意修改beans.xml中加载jdbc.properties的方式应该为classpath
@ContextConfiguration(locations = { "classpath:beans.xml" })
// 当然 你可以声明一个事务管理 每个单元测试都进行事务回滚 无论成功与否
@TransactionConfiguration(defaultRollback = true)
// 记得要在XML文件中声明事务哦~~~我是采用注解的方式
@Transactional
public class UserInfoActionTest {

	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		// webAppContextSetup 注意上面的static import
		// webAppContextSetup 构造的WEB容器可以添加fileter 但是不能添加listenCLASS
		// WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
		// 如果控制器包含如上方法 则会报空指针
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}

	@Test
	public void testSave() throws Exception {
		mockMvc.perform((post("/user/save").param("name", "111").param("pwd", "222"))) //执行请求
				.andExpect(status().isOk())//验证状态码
				.andDo(print());//输出MvcResult到控制台
	}
	
	@Test
	public void testUpdate() throws Exception {
		mockMvc.perform((post("/user/update").param("name", "111").param("pwd", "222").param("userID", "1"))) //执行请求
				.andExpect(status().isOk())//验证状态码
				.andDo(print());//输出MvcResult到控制台
	}

	@Test
	public void testDelete() throws Exception {
		mockMvc.perform(get("/user/delete/{userID}", 1)).andExpect(status().isOk()).andDo(print());
	}

	@Test
	public void testQueryData() throws Exception {
		mockMvc.perform(get("/user/query/{userID}", 3)).andExpect(status().isOk()).andDo(print());
	}
	
	@Test
	public void testListData() throws Exception {
		mockMvc.perform(get("/user/query/list")).andExpect(status().isOk()).andDo(print());
	}

//	@Test
//	public void testQueryManyData() throws Exception {
//		mockMvc.perform((post("/demo/query_datas").param("map['userName']", "jxl"))).andExpect(status().isOk()).andDo(print());
//	}

}
