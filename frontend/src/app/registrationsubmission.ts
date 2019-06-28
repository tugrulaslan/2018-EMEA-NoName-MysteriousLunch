export class RegistrationSubmission {
  constructor(username: string, cuisines: string[], interests: string[], bio: string) {
    this.username = username;
    this.cuisines = cuisines;
    this.interests = interests;
    this.bio = bio;
  }

  username: string;
  cuisines: string[];
  interests: string[];
  bio: string;
}
