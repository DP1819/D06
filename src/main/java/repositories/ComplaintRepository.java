
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Complaint;

@Repository
public interface ComplaintRepository extends GenericRepository<Complaint> {

	@Query("select c from Complaint c where c.referee.id = ?1")
	Collection<Complaint> SearchComplaintByReferee(Integer refereeId);

	@Query("select c from Complaint c where c.referee IS NULL")
	Collection<Complaint> SearchComplaintWithoutReferee();
	
	@Query("select c from Complaint c where c.fixupTask.id = ?1")
	Collection<Complaint> findByFixupTaskId(int fixupTaskId);
}
