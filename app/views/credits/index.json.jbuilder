json.array!(@credits) do |credit|
  json.extract! credit, :id,:agente_empresa,:referencia_agente_empresa,:fecha,:es_cliente,:como_se_entero,:familiar_con_prestamo,:nombre_completo_familiar_1,:parentesco_1,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_de_nacimiento,:ciudad_de_nacimiento,:estado_de_nacimiento,:sexo,:telefono_de_casa,:telefono_celular,:email_1,:email_2,:escolaridad,:numero_de_dependientes_economicos,:gasto_promedio_mensual,:estado_civil,:apellido_paterno_del_conyuge,:apellido_materno_del_conyuge,:nombre_1_del_conyuge,:nombre_2_del_conyuge,:telefono_celular_del_conyuge,:telefono_de_oficina_del_conyuge,:calle,:numero_interior,:numero_exterior,:tipo_de_domicilio,:codigo_postal,:colonia,:municipio,:antiguedad_en_el_domicilio_actual,:antiguedad_en_el_domicilio_anterior,:empresa_donde_labora,:giro_de_la_empresa,:puesto,:telefono_empresa,:sueldo_mensual_neto,:dirreccion_empresa,:colonia_empresa,:municipio_empresa,:monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago,:nombre_referencia_1,:domicilio_referencia_1,:telefono_fijo_referencia_1,:telefono_celular_referencia_1,:nombre_referencia_2,:domicilio_referencia_2,:telefono_fijo_referencia_2,:telefono_celular_referencia_2,:nombre_referencia_familiar,:domicilio_referencia_familiar,:telefono_fijo_referencia_familiar,:telefono_celular_referencia_familiar,:nombre_completo_familiar_2,:parentesco_2,:nombre_completo_1,:edad_1,:parentesco_del_dependiente_1,:nombre_completo_2,:edad_2,:parentesco_del_dependiente_2,:nombre_completo_3,:edad_3,:parentesco_del_dependiente_3,:status,:economical_activity_id,:nombre_completo_familiar_3,:parentesco_3,:nombre_completo_familiar_4,:parentesco_4,:nombre_completo_4,:edad_4,:parentesco_del_dependiente_4,:estado_actual,:localidad,:observaciones,:fecha_de_nacimiento_conyuge,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual_anos,:product_id,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses,:country,:customer_id,:antiguedad_laboral_anos,:antiguedad_laboral_meses,:numero_de_cheque,:fecha_de_contrato
  json.monto_solicitud_formato Dinero.to_money credit.monto_solicitud
  json.nombre_completo_deudor credit.nombre_completo_deudor
  json.url credit_url(credit, format: :json)
  json.nombre_padre (credit.padre.nil?)? "Desconocido":credit.padre.nombre_completo
  json.fecha_formato credit.fecha.strftime("%d/%m/%Y")
  json.cancelar credit_path(credit,:credit=>{status:2})
  json.imprimir "/view_credits/documentos?clave=#{credit.id}"
  json.tipo current_user.tipo
end
