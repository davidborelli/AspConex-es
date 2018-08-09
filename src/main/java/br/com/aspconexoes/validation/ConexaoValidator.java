package br.com.aspconexoes.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.aspconexoes.models.Conexao;

public class ConexaoValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Conexao.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "id_ip", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "tipo", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "municipio.id", "field.required");
	}

}
