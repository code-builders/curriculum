states = {
  ut: "Utah",
  wa: "Washington",
  or: "Oregon",
  ca: "California",
  ga: "Georgia",
  md: "Maryland"
}

people = ["LeShoya", "Tammy", "Chris", "Evelyn", "Daniel", "Karen"]
languages = ["Ruby", "Javascript", "Python", "Java"]

1. states[:wa].reverse
2. languages[6]
3.
  person = people[2]
  i = person.chars.size - 2
  languages[i]
4. :hello.to_s.chars.first
5.
  letter = people.last.downcase.chars[1]
  states["c#{letter}".to_sym]
6.
  states[:nv] = "Nevada"
  states
  {
    ut: "Utah",
    wa: "Washington",
    or: "Oregon",
    ca: "California",
    ga: "Georgia",
    md: "Maryland",
    nv: "Nevada"
  }
7.
  states[:nv] = "Nevada"
  i = 0
  # ["LeShoya", "Tammy", "Chris", "Evelyn", "Daniel", "Karen"]
  people.each do |person|
    i = person.chars.size * states.size
  end
  i
8. states[:ga].downcase.reverse.to_sym
