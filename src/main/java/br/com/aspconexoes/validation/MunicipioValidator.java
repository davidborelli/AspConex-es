package br.com.aspconexoes.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.aspconexoes.models.Municipio;

public class MunicipioValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Municipio.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
	}

}
