
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ComplaintRepository;
import domain.Complaint;
import domain.Referee;

@Service
@Transactional
public class ComplaintService {

	//Managed Repository

	@Autowired
	private ComplaintRepository	complaintRepository;


	// Simple CRUD methods

	public Complaint create() {
		final Complaint c = new Complaint();
		return c;
	}

	public Collection<Complaint> findAll() {
		return this.complaintRepository.findAll();
	}

	public Complaint findOne(final int complaintId) {
		return this.complaintRepository.findOne(complaintId);
	}

	public Complaint save(final Complaint c) {
		Assert.notNull(c);
		return this.complaintRepository.save(c);
	}

	public void delete(final Complaint c) {
		Assert.notNull(c);
		this.complaintRepository.delete(c);
	}

	public Collection<Complaint> findAllComplaintsByReferee(final Referee r) {
		return this.complaintRepository.SearchComplaintByReferee(r);
	}

	public Collection<Complaint> findAllComplaintsWithoutReferee() {
		return this.complaintRepository.SearchComplaintWithoutReferee();
	}
}