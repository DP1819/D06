
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.CurriculumRepository;
import domain.Actor;
import domain.Curriculum;
import domain.EducationRecord;
import domain.EndorserRecord;
import domain.HandyWorker;
import domain.MiscellaneousRecord;
import domain.PersonalRecord;
import domain.ProfessionalRecord;

@Service
@Transactional
public class CurriculumService {

	// Managed repository --------------------------------------

	@Autowired
	private CurriculumRepository	curriculumRepository;

	// Supporting services----------------------------------------------

	@Autowired
	private TicketableService		ticketableService;
	@Autowired
	private HandyWorkerService		handyWorkerService;


	//	@Autowired
	//	private EducationRecordService		eduactionRecordService;
	//	@Autowired
	//	private ProfessionalRecordService	professionalRecordService;
	//	@Autowired
	//	private EndorserRecordService		endorserRecordSercvice;
	//	@Autowired
	//	private MiscellaneousRecordService	miscellaneousRecordService;

	// Simple CRUD methods -----------------------------------------------------------

	public Curriculum create() {
		Curriculum res;

		res = new Curriculum();

		//res.setHandyWorker(new HandyWorker());
		res.setTicker(this.ticketableService.createTicker());
		res.setPersonalRecord(new PersonalRecord());
		res.setEducationRecords(new ArrayList<EducationRecord>());
		res.setProfessionalRecords(new ArrayList<ProfessionalRecord>());
		res.setEndorserRecords(new ArrayList<EndorserRecord>());
		res.setMiscellaneousRecords(new ArrayList<MiscellaneousRecord>());

		return res;
	}

	public Curriculum findOne(final int curriculumId) {
		Curriculum res;

		res = this.curriculumRepository.findOne(curriculumId);

		return res;
	}

	public Collection<Curriculum> findAll() {
		Collection<Curriculum> res;

		res = this.curriculumRepository.findAll();

		return res;
	}

	public Curriculum save(final Curriculum curriculum) {
		Assert.notNull(curriculum);
		Curriculum res;

		Assert.notNull(curriculum.getHandyWorker());
		Assert.notNull(curriculum.getPersonalRecord());

		this.curriculumRepository.flush();

		res = this.curriculumRepository.save(curriculum);

		return res;
	}

	public void delete(final Curriculum curriculum) {
		//compruebo que no sea nulo
		Assert.notNull(curriculum);

		//		final PersonalRecord personalRecord;
		//		final Collection<EducationRecord> educationRecords;
		//		final Collection<ProfessionalRecord> professionalRecords;
		//		final Collection<EndorserRecord> endorserRecords;
		//		final Collection<MiscellaneousRecord> miscellaneousRecords;

		//guardo sus atributos
		//		handyWorker = curriculum.getHandyWorker();
		//		personalRecord = curriculum.getPersonalRecord();
		//		educationRecords = curriculum.getEducationRecords();
		//		professionalRecords = curriculum.getProfessionalRecords();
		//		endorserRecords = curriculum.getEndorserRecords();
		//		miscellaneousRecords = curriculum.getMiscellaneousRecords();

		//dejo vacías las colecciones para que no de error al borrar el curriculum
		//		curriculum.setEducationRecords(new ArrayList<EducationRecord>());
		//		curriculum.setProfessionalRecords(new ArrayList<ProfessionalRecord>());
		//		curriculum.setEndorserRecords(new ArrayList<EndorserRecord>());
		//		curriculum.setMiscellaneousRecords(new ArrayList<MiscellaneousRecord>());

		//borro el contenido de las colecciones
		//		this.eduactionRecordService.delete(educationRecords);
		//		this.professionalRecordService.delete(professionalRecords);
		//		this.endorserRecordSercvice.delete(endorserRecords);
		//		this.miscellaneousRecordService.delete(miscellaneousRecords);

		this.curriculumRepository.delete(curriculum);

	}

	public Curriculum findByHandyWorker(final HandyWorker h) {
		Assert.notNull(h);
		Assert.isTrue(h.getId() > 0);
		Assert.notNull(this.handyWorkerService.findOne(h.getId()));
		return this.curriculumRepository.findByHandyWorkerId(h.getId());
	}

	public Collection<Curriculum> findAllByActor(final Actor a) {
		Assert.notNull(a);
		Assert.isTrue(a.getId() > 0);
		Assert.notNull(this.handyWorkerService.findOne(a.getId()));
		final Collection<Curriculum> res = new ArrayList<Curriculum>();
		res.add(this.findByHandyWorker(this.handyWorkerService.findOne(a.getId())));
		return res;
	}

	public Curriculum create(final Actor a) {
		Assert.notNull(a);
		Assert.isTrue(a.getId() > 0);
		Assert.notNull(this.handyWorkerService.findOne(a.getId()));
		final Curriculum res = this.create();
		res.setHandyWorker(this.handyWorkerService.findOne(a.getId()));
		return res;
	}

}
