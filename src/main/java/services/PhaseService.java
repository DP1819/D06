
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.PhaseRepository;
import security.Authority;
import domain.Phase;
import domain.WorkPlan;

@Service
@Transactional
public class PhaseService {

	// Repository

	@Autowired
	private PhaseRepository	repository;

	// Services

	@Autowired
	private WorkPlanService	workPlanService;
	@Autowired
	private ServiceUtils	serviceUtils;


	// CRUD methods

	public Phase findOne(final Integer id) {
		this.serviceUtils.checkId(id);
		return this.repository.findOne(id);
	}

	public Collection<Phase> findAll(final Collection<Integer> ids) {
		this.serviceUtils.checkIds(ids);
		return this.repository.findAll(ids);
	}

	public Collection<Phase> findAll() {
		return this.repository.findAll();
	}

	public Collection<Phase> findAll(final WorkPlan dependency) {
		this.serviceUtils.checkId(dependency);
		Assert.notNull(this.workPlanService.findOne(dependency.getId()));
		return this.repository.findByWorkPlan(dependency.getId());
	}

	public Phase create(final WorkPlan dependency) {
		final Phase res = new Phase();
		res.setWorkPlan(dependency);
		this.serviceUtils.checkActor(res.getWorkPlan().getHandyWorker());
		this.serviceUtils.checkAuthority(Authority.HANDYWORKER);
		return res;
	}

	public Phase create2() {
		final Phase res = new Phase();
		return res;
	}

	public Phase save(final Phase object) {
		final Phase phase = (Phase) this.serviceUtils.checkObjectSave(object);
		if (object.getId() > 0) {
			final Phase old = this.findOne(phase.getId());
			old.setDescription(phase.getDescription());
			old.setEnd(phase.getEnd());
			old.setStart(phase.getStart());
			old.setTitle(phase.getTitle());
		}
		//		Assert.isTrue(phase.getEnd().before(phase.getWorkPlan().getFixupTask().getEnd()));
		final Phase res = this.repository.save(object);
		return res;
	}

	public void delete(final Phase object) {
		final Phase phase = (Phase) this.serviceUtils.checkObject(object);
		this.repository.delete(phase);
	}

	// Other methods

	public void flush() {
		this.repository.flush();
	}

}
