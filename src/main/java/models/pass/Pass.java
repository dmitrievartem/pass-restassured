package models.pass;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Pass {
    @JsonProperty("personName")
    private String personName;

    @JsonProperty("personSurname")
    private String personSurname;

    @JsonProperty("personPatronymic")
    private String personPatronymic;

    @JsonProperty("passportNumber")
    private String passportNumber;

    @JsonProperty("dateFrom")
    private String dateFrom;

    @JsonProperty("dateTo")
    private String dateTo;


}
