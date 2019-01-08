
package services;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.FixupTaskRepository;
import domain.Category;
import domain.Customer;
import domain.FixupTask;
import domain.HandyWorker;
import domain.Warranty;

@Service
@Transactional
public class FixupTaskService {

	//Managed Repository

	@Autowired
	private FixupTaskRepository	fixupTaskRepository;

	// Supporting Service

	@Autowired
	private CategoryService		categoryService;
	@Autowired
	private CustomerService		customerService;
	@Autowired
	private WarrantyService		warrantyService;
	@Autowired
	private TicketableService	ticketableService;
	@Autowired
	private ServiceUtils		serviceUtils;


	//

	public FixupTaskService() {
		super();
	}
	// Simple CRUD methods

	public FixupTask create() {
		FixupTask ft;
		Warranty w;
		Category c;
		Customer ct;
		String t;
		w = this.warrantyService.create();
		c = this.categoryService.create();
		ct = this.customerService.create();
		t = this.ticketableService.createTicker().toString();
		ft = new FixupTask();
		ft.setWarranty(w);
		ft.setCategory(c);
		ft.setCustomer(ct);
		ft.setTicker(t);

		return ft;
	}

	public Collection<FixupTask> findAll() {
		Collection<FixupTask> ft;
		ft = this.fixupTaskRepository.findAll();
		return ft;
	}

	public FixupTask findOne(final int fixupTaskId) {
		FixupTask res;
		res = this.fixupTaskRepository.findOne(fixupTaskId);
		return res;

	}

	//	public FixupTask save(final FixupTask f) {
	//
	//		Assert.notNull(f);
	//		System.out.println("a");
	//		this.fixupTaskRepository.save(f);
	//		System.out.println("b");
	//		System.out.println(f.getWarranty());
	//		System.out.println("c");
	//
	//		return f;
	//	}

	public FixupTask save(final FixupTask f) {
		//comprobamos que el customer que nos pasan no sea nulo
		Assert.notNull(f);
		Boolean isCreating = null;

		isCreating = false;
		//comprobamos que su id no sea negativa por motivos de seguridad
		this.serviceUtils.checkIdSave(f);

		//este customer ser� el que est� en la base de datos para usarlo si estamos ante un customer que ya existe
		FixupTask fBD;
		Assert.isTrue(f.getId() > 0);

		//cogemos el customer de la base de datos
		fBD = this.fixupTaskRepository.findOne(f.getId());

		//Si el customer que estamos guardando es nuevo (no est� en la base de datos) le ponemos todos sus atributos vac�os

		f.setCategory(fBD.getCategory());
		f.setWarranty(fBD.getWarranty());
		f.setCustomer(fBD.getCustomer());

		FixupTask res;
		res = this.fixupTaskRepository.save(f);
		this.flush();
		if (isCreating)
			this.customerService.getAllFixupTasks().add(res);
		return res;
	}

	public void flush() {
		this.fixupTaskRepository.flush();
	}
	public void delete(final FixupTask f) {
		Assert.notNull(f);
		//Assert.isTrue(p.getId() != 0);
		this.fixupTaskRepository.delete(f);
	}

	//Other methods

	public Map<String, Double> appsStats() {
		final Double[] statistics = this.fixupTaskRepository.appsStats();
		final Map<String, Double> res = new HashMap<>();

		res.put("MIN", statistics[0]);
		res.put("MAX", statistics[1]);
		res.put("AVG", statistics[2]);
		res.put("STD", statistics[3]);
		return res;
	}

	public Map<String, Double> maxFixupStaskStats() {
		final Double[] statistics = this.fixupTaskRepository.maxFixupStaskStats();
		final Map<String, Double> res = new HashMap<>();

		res.put("MIN", statistics[0]);
		res.put("MAX", statistics[1]);
		res.put("AVG", statistics[2]);
		res.put("STD", statistics[3]);

		return res;
	}

	public Map<String, Double> getRatioFixupTasksWithComplaints() {
		final Double ratio = this.fixupTaskRepository.ratiofixupComplaint();
		final Map<String, Double> res = new HashMap<>();

		res.put("Ratio", ratio);

		return res;
	}

	public Map<String, Double> fixupComplaintsStats() {
		final Double[] statistics = this.fixupTaskRepository.fixupComplaintsStats();
		final Map<String, Double> res = new HashMap<>();
		res.put("MIN", statistics[0]);
		res.put("MAX", statistics[1]);
		res.put("AVG", statistics[2]);
		res.put("STD", statistics[3]);

		return res;

	}

	public Collection<FixupTask> findByCategory(final Category category) {
		Assert.notNull(category);
		Assert.isTrue(category.getId() > 0);
		Assert.notNull(this.categoryService.findOne(category.getId()));
		return this.fixupTaskRepository.findByCategoryId(category.getId());
	}

	public Collection<FixupTask> findByCustomer(final Customer customer) {
		Assert.notNull(customer);
		Assert.isTrue(customer.getId() > 0);
		Assert.notNull(this.customerService.findOne(customer.getId()));
		return this.fixupTaskRepository.findByCustomerId(customer.getId());
	}

	public Collection<FixupTask> findByWarranty(final Warranty warranty) {
		Assert.notNull(warranty);
		Assert.isTrue(warranty.getId() > 0);
		Assert.notNull(this.warrantyService.findOne(warranty.getId()));
		return this.fixupTaskRepository.findByWarrantyId(warranty.getId());
	}

	public Collection<FixupTask> findAcceptedFixupTasks() {
		// TODO Auto-generated method stub
		return this.fixupTaskRepository.findAcceptedFixupTasks();
	}

	public Collection<FixupTask> findAcceptedFixupTasksByHandyWorker(final HandyWorker h) {
		final HandyWorker handyWorker = (HandyWorker) this.serviceUtils.checkObject(h);
		// TODO Auto-generated method stub
		return this.fixupTaskRepository.findAcceptedFixupTasksByHandyWorker(handyWorker.getId());
	}
}
