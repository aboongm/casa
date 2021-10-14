context("Logging into cypress as a volunteer", () => {
  before(() => {
    cy.visit("0.0.0.0:4040");
    cy.loginAsVolunteer();
  });
  // TODO - fix flakey spec ref: https://github.com/rubyforgood/casa/issues/2550#issuecomment-943474980
  it.skip("should edit the profile", () => {
    cy.get("#toggle-sidebar-js").click();
    cy.contains("Edit Profile").click();
    cy.contains("Change Password").click();
    cy.contains("Current Password").should("exist");
    cy.contains("New Password").should("exist");
    cy.contains("New Password Confirmation").should("exist");
    cy.contains("Update Profile").click();
    cy.contains("Profile was successfully updated.").should("exist");
  });
});
