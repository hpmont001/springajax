import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.domain.Food;
import com.service.FoodService;
import com.service.impl.FoodServiceImpl;

public class FoodServiceTest {

	private ApplicationContext applicationContext = null;
	private FoodService foodService;

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("springmvc.xml");
		foodService = applicationContext.getBean(FoodServiceImpl.class);

	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetSize() {
		int size = foodService.getSize();
		System.out.println(size);
	}

	@Test
	public void testGetAll() {
		List<Food> foods = foodService.getAll(0, 5);
		System.out.println(foods.size());
	}

	@Test
	public void testGetById() {
		Food food = foodService.getById(1);
		System.out.println(food.name);
	}

}
