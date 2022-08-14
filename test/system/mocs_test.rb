require "application_system_test_case"

class MocsTest < ApplicationSystemTestCase
  setup do
    @moc = mocs(:one)
  end

  test "visiting the index" do
    visit mocs_url
    assert_selector "h1", text: "Mocs"
  end

  test "should create moc" do
    visit mocs_url
    click_on "New moc"

    fill_in "Add actual 1", with: @moc.add_actual_1
    fill_in "Add actual 2", with: @moc.add_actual_2
    fill_in "Add actual 3", with: @moc.add_actual_3
    fill_in "Add actual 4", with: @moc.add_actual_4
    fill_in "Add actual 5", with: @moc.add_actual_5
    fill_in "Add actual 6", with: @moc.add_actual_6
    fill_in "Add target 1", with: @moc.add_target_1
    fill_in "Add target 2", with: @moc.add_target_2
    fill_in "Add target 3", with: @moc.add_target_3
    fill_in "Add target 4", with: @moc.add_target_4
    fill_in "Add target 5", with: @moc.add_target_5
    fill_in "Add target 6", with: @moc.add_target_6
    fill_in "Cleanlinesstotal", with: @moc.cleanlinessTotal
    fill_in "Cleanliness score", with: @moc.cleanliness_score
    fill_in "Coachsignature", with: @moc.coachSignature
    fill_in "Di guest actual 1", with: @moc.di_guest_actual_1
    fill_in "Di guest actual 2", with: @moc.di_guest_actual_2
    fill_in "Di guest actual 3", with: @moc.di_guest_actual_3
    fill_in "Di guest target 1", with: @moc.di_guest_target_1
    fill_in "Di guest target 2", with: @moc.di_guest_target_2
    fill_in "Di guest target 3", with: @moc.di_guest_target_3
    fill_in "Di time actual 1", with: @moc.di_time_actual_1
    fill_in "Di time actual 2", with: @moc.di_time_actual_2
    fill_in "Di time actual 3", with: @moc.di_time_actual_3
    fill_in "Di time target 1", with: @moc.di_time_target_1
    fill_in "Di time target 2", with: @moc.di_time_target_2
    fill_in "Di time target 3", with: @moc.di_time_target_3
    fill_in "Dt actual 1", with: @moc.dt_actual_1
    fill_in "Dt actual 2", with: @moc.dt_actual_2
    fill_in "Dt actual 3", with: @moc.dt_actual_3
    fill_in "Dt oepe actual 1", with: @moc.dt_oepe_actual_1
    fill_in "Dt oepe actual 2", with: @moc.dt_oepe_actual_2
    fill_in "Dt oepe actual 3", with: @moc.dt_oepe_actual_3
    fill_in "Dt oepe target 1", with: @moc.dt_oepe_target_1
    fill_in "Dt oepe target 2", with: @moc.dt_oepe_target_2
    fill_in "Dt oepe target 3", with: @moc.dt_oepe_target_3
    fill_in "Dt target 1", with: @moc.dt_target_1
    fill_in "Dt target 2", with: @moc.dt_target_2
    fill_in "Dt target 3", with: @moc.dt_target_3
    fill_in "Duringshiftsuccess", with: @moc.duringShiftSuccess
    fill_in "Moc date", with: @moc.moc_date
    fill_in "Moc time", with: @moc.moc_time
    fill_in "Morepracticecomments", with: @moc.morePracticeComments
    fill_in "Opstotal", with: @moc.opsTotal
    fill_in "Ops score", with: @moc.ops_score
    fill_in "Organization", with: @moc.organization_id
    fill_in "Postshiftsuccess", with: @moc.postShiftSuccess
    fill_in "Preshiftsuccess", with: @moc.preshiftSuccess
    fill_in "Q1", with: @moc.q1
    fill_in "Q10", with: @moc.q10
    fill_in "Q11", with: @moc.q11
    fill_in "Q12", with: @moc.q12
    fill_in "Q13", with: @moc.q13
    fill_in "Q14", with: @moc.q14
    fill_in "Q15", with: @moc.q15
    fill_in "Q16", with: @moc.q16
    fill_in "Q17", with: @moc.q17
    fill_in "Q18", with: @moc.q18
    fill_in "Q19", with: @moc.q19
    fill_in "Q2", with: @moc.q2
    fill_in "Q20", with: @moc.q20
    fill_in "Q21", with: @moc.q21
    fill_in "Q22", with: @moc.q22
    fill_in "Q23", with: @moc.q23
    fill_in "Q24", with: @moc.q24
    fill_in "Q25", with: @moc.q25
    fill_in "Q26", with: @moc.q26
    fill_in "Q27", with: @moc.q27
    fill_in "Q28", with: @moc.q28
    fill_in "Q29", with: @moc.q29
    fill_in "Q3", with: @moc.q3
    fill_in "Q30", with: @moc.q30
    fill_in "Q31", with: @moc.q31
    fill_in "Q32", with: @moc.q32
    fill_in "Q33", with: @moc.q33
    fill_in "Q34", with: @moc.q34
    fill_in "Q35", with: @moc.q35
    fill_in "Q36", with: @moc.q36
    fill_in "Q37", with: @moc.q37
    fill_in "Q38", with: @moc.q38
    fill_in "Q39", with: @moc.q39
    fill_in "Q4", with: @moc.q4
    fill_in "Q40", with: @moc.q40
    fill_in "Q41", with: @moc.q41
    fill_in "Q42", with: @moc.q42
    fill_in "Q43", with: @moc.q43
    fill_in "Q44", with: @moc.q44
    fill_in "Q45", with: @moc.q45
    fill_in "Q46", with: @moc.q46
    fill_in "Q47", with: @moc.q47
    fill_in "Q48", with: @moc.q48
    fill_in "Q49", with: @moc.q49
    fill_in "Q5", with: @moc.q5
    fill_in "Q50", with: @moc.q50
    fill_in "Q51", with: @moc.q51
    fill_in "Q52", with: @moc.q52
    fill_in "Q53", with: @moc.q53
    fill_in "Q54", with: @moc.q54
    fill_in "Q55", with: @moc.q55
    fill_in "Q56", with: @moc.q56
    fill_in "Q57", with: @moc.q57
    fill_in "Q58", with: @moc.q58
    fill_in "Q59", with: @moc.q59
    fill_in "Q6", with: @moc.q6
    fill_in "Q60", with: @moc.q60
    fill_in "Q61", with: @moc.q61
    fill_in "Q62", with: @moc.q62
    fill_in "Q63", with: @moc.q63
    fill_in "Q64", with: @moc.q64
    fill_in "Q7", with: @moc.q7
    fill_in "Q8", with: @moc.q8
    fill_in "Q9", with: @moc.q9
    fill_in "Qualitytotal", with: @moc.qualityTotal
    fill_in "Quality score", with: @moc.quality_score
    fill_in "Servicetotal", with: @moc.serviceTotal
    fill_in "Service score", with: @moc.service_score
    fill_in "Slsignature", with: @moc.slSignature
    fill_in "Store", with: @moc.store_id
    check "Verified" if @moc.verified
    fill_in "Verygoodcomments", with: @moc.veryGoodComments
    click_on "Create Moc"

    assert_text "Moc was successfully created"
    click_on "Back"
  end

  test "should update Moc" do
    visit moc_url(@moc)
    click_on "Edit this moc", match: :first

    fill_in "Add actual 1", with: @moc.add_actual_1
    fill_in "Add actual 2", with: @moc.add_actual_2
    fill_in "Add actual 3", with: @moc.add_actual_3
    fill_in "Add actual 4", with: @moc.add_actual_4
    fill_in "Add actual 5", with: @moc.add_actual_5
    fill_in "Add actual 6", with: @moc.add_actual_6
    fill_in "Add target 1", with: @moc.add_target_1
    fill_in "Add target 2", with: @moc.add_target_2
    fill_in "Add target 3", with: @moc.add_target_3
    fill_in "Add target 4", with: @moc.add_target_4
    fill_in "Add target 5", with: @moc.add_target_5
    fill_in "Add target 6", with: @moc.add_target_6
    fill_in "Cleanlinesstotal", with: @moc.cleanlinessTotal
    fill_in "Cleanliness score", with: @moc.cleanliness_score
    fill_in "Coachsignature", with: @moc.coachSignature
    fill_in "Di guest actual 1", with: @moc.di_guest_actual_1
    fill_in "Di guest actual 2", with: @moc.di_guest_actual_2
    fill_in "Di guest actual 3", with: @moc.di_guest_actual_3
    fill_in "Di guest target 1", with: @moc.di_guest_target_1
    fill_in "Di guest target 2", with: @moc.di_guest_target_2
    fill_in "Di guest target 3", with: @moc.di_guest_target_3
    fill_in "Di time actual 1", with: @moc.di_time_actual_1
    fill_in "Di time actual 2", with: @moc.di_time_actual_2
    fill_in "Di time actual 3", with: @moc.di_time_actual_3
    fill_in "Di time target 1", with: @moc.di_time_target_1
    fill_in "Di time target 2", with: @moc.di_time_target_2
    fill_in "Di time target 3", with: @moc.di_time_target_3
    fill_in "Dt actual 1", with: @moc.dt_actual_1
    fill_in "Dt actual 2", with: @moc.dt_actual_2
    fill_in "Dt actual 3", with: @moc.dt_actual_3
    fill_in "Dt oepe actual 1", with: @moc.dt_oepe_actual_1
    fill_in "Dt oepe actual 2", with: @moc.dt_oepe_actual_2
    fill_in "Dt oepe actual 3", with: @moc.dt_oepe_actual_3
    fill_in "Dt oepe target 1", with: @moc.dt_oepe_target_1
    fill_in "Dt oepe target 2", with: @moc.dt_oepe_target_2
    fill_in "Dt oepe target 3", with: @moc.dt_oepe_target_3
    fill_in "Dt target 1", with: @moc.dt_target_1
    fill_in "Dt target 2", with: @moc.dt_target_2
    fill_in "Dt target 3", with: @moc.dt_target_3
    fill_in "Duringshiftsuccess", with: @moc.duringShiftSuccess
    fill_in "Moc date", with: @moc.moc_date
    fill_in "Moc time", with: @moc.moc_time
    fill_in "Morepracticecomments", with: @moc.morePracticeComments
    fill_in "Opstotal", with: @moc.opsTotal
    fill_in "Ops score", with: @moc.ops_score
    fill_in "Organization", with: @moc.organization_id
    fill_in "Postshiftsuccess", with: @moc.postShiftSuccess
    fill_in "Preshiftsuccess", with: @moc.preshiftSuccess
    fill_in "Q1", with: @moc.q1
    fill_in "Q10", with: @moc.q10
    fill_in "Q11", with: @moc.q11
    fill_in "Q12", with: @moc.q12
    fill_in "Q13", with: @moc.q13
    fill_in "Q14", with: @moc.q14
    fill_in "Q15", with: @moc.q15
    fill_in "Q16", with: @moc.q16
    fill_in "Q17", with: @moc.q17
    fill_in "Q18", with: @moc.q18
    fill_in "Q19", with: @moc.q19
    fill_in "Q2", with: @moc.q2
    fill_in "Q20", with: @moc.q20
    fill_in "Q21", with: @moc.q21
    fill_in "Q22", with: @moc.q22
    fill_in "Q23", with: @moc.q23
    fill_in "Q24", with: @moc.q24
    fill_in "Q25", with: @moc.q25
    fill_in "Q26", with: @moc.q26
    fill_in "Q27", with: @moc.q27
    fill_in "Q28", with: @moc.q28
    fill_in "Q29", with: @moc.q29
    fill_in "Q3", with: @moc.q3
    fill_in "Q30", with: @moc.q30
    fill_in "Q31", with: @moc.q31
    fill_in "Q32", with: @moc.q32
    fill_in "Q33", with: @moc.q33
    fill_in "Q34", with: @moc.q34
    fill_in "Q35", with: @moc.q35
    fill_in "Q36", with: @moc.q36
    fill_in "Q37", with: @moc.q37
    fill_in "Q38", with: @moc.q38
    fill_in "Q39", with: @moc.q39
    fill_in "Q4", with: @moc.q4
    fill_in "Q40", with: @moc.q40
    fill_in "Q41", with: @moc.q41
    fill_in "Q42", with: @moc.q42
    fill_in "Q43", with: @moc.q43
    fill_in "Q44", with: @moc.q44
    fill_in "Q45", with: @moc.q45
    fill_in "Q46", with: @moc.q46
    fill_in "Q47", with: @moc.q47
    fill_in "Q48", with: @moc.q48
    fill_in "Q49", with: @moc.q49
    fill_in "Q5", with: @moc.q5
    fill_in "Q50", with: @moc.q50
    fill_in "Q51", with: @moc.q51
    fill_in "Q52", with: @moc.q52
    fill_in "Q53", with: @moc.q53
    fill_in "Q54", with: @moc.q54
    fill_in "Q55", with: @moc.q55
    fill_in "Q56", with: @moc.q56
    fill_in "Q57", with: @moc.q57
    fill_in "Q58", with: @moc.q58
    fill_in "Q59", with: @moc.q59
    fill_in "Q6", with: @moc.q6
    fill_in "Q60", with: @moc.q60
    fill_in "Q61", with: @moc.q61
    fill_in "Q62", with: @moc.q62
    fill_in "Q63", with: @moc.q63
    fill_in "Q64", with: @moc.q64
    fill_in "Q7", with: @moc.q7
    fill_in "Q8", with: @moc.q8
    fill_in "Q9", with: @moc.q9
    fill_in "Qualitytotal", with: @moc.qualityTotal
    fill_in "Quality score", with: @moc.quality_score
    fill_in "Servicetotal", with: @moc.serviceTotal
    fill_in "Service score", with: @moc.service_score
    fill_in "Slsignature", with: @moc.slSignature
    fill_in "Store", with: @moc.store_id
    check "Verified" if @moc.verified
    fill_in "Verygoodcomments", with: @moc.veryGoodComments
    click_on "Update Moc"

    assert_text "Moc was successfully updated"
    click_on "Back"
  end

  test "should destroy Moc" do
    visit moc_url(@moc)
    click_on "Destroy this moc", match: :first

    assert_text "Moc was successfully destroyed"
  end
end
