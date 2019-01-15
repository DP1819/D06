
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.PersonalRecord;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class PersonalRecordServiceTest extends AbstractTest {

	//Service under test ----------------------------------------

	@Autowired
	private PersonalRecordService	personalRecordService;


	//------------------------------------------------------------

	@Test
	public void testCreate() {
		final PersonalRecord pr = this.personalRecordService.create();
		Assert.notNull(pr);
	}

	@Test
	public void testFindOneCorrecto() {
		PersonalRecord pr;
		final int idBusqueda = super.getEntityId("personalRecord1");
		pr = this.personalRecordService.findOne(idBusqueda);
		Assert.notNull(pr);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFindOneIncorrecto() {
		PersonalRecord pr;
		final int idBusqueda = super.getEntityId("personareco");
		pr = this.personalRecordService.findOne(idBusqueda);
		Assert.isNull(pr);
	}

	@Test
	public void testFindAll() {
		Collection<PersonalRecord> personalRecords;

		personalRecords = this.personalRecordService.findAll();
		Assert.notNull(personalRecords);
		Assert.notEmpty(personalRecords);
	}

	@Test
	public void saveTestCorrecto() {
		PersonalRecord pr, saved;
		final int erId = this.getEntityId("personalRecord1");
		pr = this.personalRecordService.findOne(erId);
		Assert.notNull(pr);

		pr.setFullName("Nombre cambiado para test");
		saved = this.personalRecordService.save(pr);
		Assert.isTrue(saved.getFullName().equals("Nombre cambiado para test"));
	}

	@Test(expected = IllegalArgumentException.class)
	public void saveTestIncorrecto() {
		PersonalRecord pr;
		PersonalRecord saved;
		final int erId = this.getEntityId("personalRecord1");
		pr = this.personalRecordService.findOne(erId);
		Assert.notNull(pr);

		//pr.setCurriculum(null);
		saved = this.personalRecordService.save(pr);
		Assert.isNull(saved);
	}

	@Test
	public void deleteTestCorrecto() {
		PersonalRecord pr;
		final int erId = this.getEntityId("personalRecord2");
		pr = this.personalRecordService.findOne(erId);
		Assert.notNull(pr);

		this.personalRecordService.delete(pr);
		Assert.isNull(pr = this.personalRecordService.findOne(erId));
	}

	@Test(expected = IllegalArgumentException.class)
	public void deleteTestIncorrecto() {
		PersonalRecord pr;
		final int erId = this.getEntityId("Error intencionado");
		pr = this.personalRecordService.findOne(erId);
		Assert.notNull(pr);

		this.personalRecordService.delete(pr);
		Assert.isNull(pr = this.personalRecordService.findOne(erId));
	}

}
