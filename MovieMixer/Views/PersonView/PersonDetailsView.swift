//
//  PersonDetailsView.swift
//  MovieMixer
//
//  Created by User on 1.05.23.
//

import SwiftUI

struct PersonDetailsView: View {
    
    @State var person: Person
    var language: Language
    
    var body: some View {
        ScrollView {
            HStack{
                AsyncImage(url: person.profileURL){image in
                    image
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }placeholder: {
                    ProgressView()
                }
                .padding(.leading, 10.0)
                Spacer()
                VStack{
                    Text(person.name)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    if language.language == .en {
                        Text("Born: \(person.birthday)")
                            .foregroundColor(.white)
                        Text("Birth place: \(person.place_of_birth)")
                            .foregroundColor(.white)
                        Text("Known for: \(person.known_for_department)")
                            .foregroundColor(.white)
                        Text("Popularity: \(person.popularity)")
                            .foregroundColor(.white)
                    }
                    
                    else {
                        Text("Дата рождения: \(person.birthday)")
                            .foregroundColor(.white)
                        Text("Место рождения: \(person.place_of_birth)")
                            .foregroundColor(.white)
                        Text("Известен за: \(person.known_for_department)")
                            .foregroundColor(.white)
                        Text("Популярность: \(person.popularity)")
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
            }
            .padding(.top, 20.0)
            VStack{
                HStack{
                    if language.language == .en {
                        Text("Biography:")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    else {
                        Text("Биография:")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                        
                    Spacer()
                }
                Text(person.biography)
                    .foregroundColor(.white)
            }
            .padding(.leading, 10.0)
            Spacer()
        }
        .background( Color(red:39/255,green:40/255,blue:59/255))
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(person: Person(birthday: "1963-12-18", known_for_department: "Acting", id: 287, name: "Brad Pitt", biography: "William Bradley \"Brad\" Pitt (born December 18, 1963) is an American actor and film producer. Pitt has received two Academy Award nominations and four Golden Globe Award nominations, winning one. He has been described as one of the world's most attractive men, a label for which he has received substantial media attention. Pitt began his acting career with television guest appearances, including a role on the CBS prime-time soap opera Dallas in 1987. He later gained recognition as the cowboy hitchhiker who seduces Geena Davis's character in the 1991 road movie Thelma & Louise. Pitt's first leading roles in big-budget productions came with A River Runs Through It (1992) and Interview with the Vampire (1994). He was cast opposite Anthony Hopkins in the 1994 drama Legends of the Fall, which earned him his first Golden Globe nomination. In 1995 he gave critically acclaimed performances in the crime thriller Seven and the science fiction film 12 Monkeys, the latter securing him a Golden Globe Award for Best Supporting Actor and an Academy Award nomination.\n\nFour years later, in 1999, Pitt starred in the cult hit Fight Club. He then starred in the major international hit as Rusty Ryan in Ocean's Eleven (2001) and its sequels, Ocean's Twelve (2004) and Ocean's Thirteen (2007). His greatest commercial successes have been Troy (2004) and Mr. & Mrs. Smith (2005).\n\nPitt received his second Academy Award nomination for his title role performance in the 2008 film The Curious Case of Benjamin Button. Following a high-profile relationship with actress Gwyneth Paltrow, Pitt was married to actress Jennifer Aniston for five years. Pitt lives with actress Angelina Jolie in a relationship that has generated wide publicity. He and Jolie have six children—Maddox, Pax, Zahara, Shiloh, Knox, and Vivienne.\n\nSince beginning his relationship with Jolie, he has become increasingly involved in social issues both in the United States and internationally. Pitt owns a production company named Plan B Entertainment, whose productions include the 2007 Academy Award winning Best Picture, The Departed.", popularity: 10.647, place_of_birth: "Shawnee, Oklahoma, USA", profile_path: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg"), language: Language())
    }
}
