package vn.uit.trainingmanagement.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name="reply")
public class Reply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotBlank(message = "reply content is mandatory")
    private String content;
    @ManyToOne
    @JoinColumn(name = "question_id")
    private Question questionDetail;

    public Question getQuestionDetail() {
        return questionDetail;
    }

    public void setQuestionDetail(Question questionDetail) {
        this.questionDetail = questionDetail;
    }
}
