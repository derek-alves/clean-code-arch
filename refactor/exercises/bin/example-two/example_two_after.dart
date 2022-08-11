class ExampleTwoAfter {
  static validate(str) {
    if (str != null) {
      if (str.isNotEmpty) {
        if (str.length >= 11 || str.length <= 14) {
          str = str
              .replaceAll('.', '')
              .replaceAll('.', '')
              .replaceAll('-', '')
              .replaceAll(" ", '');

          if (!str.split("").every((c) => c == str[0])) {
            try {
              var d1, d2;
              var dg1, dg2, rest;
              var digito;

              String nDigResult, nDigVerific = "";

              d1 = d2 = 0;
              dg1 = dg2 = rest = 0;

              for (var nCount = 1; nCount < str.length - 1; nCount++) {
                digito = int.parse(str.substring(nCount - 1, nCount));
                d1 = d1 + (11 - nCount) * digito;

                d2 = d2 + (12 - nCount) * digito;
              }
              rest = (d1 % 11);

              dg1 = (rest < 2) ? dg1 = 0 : 11 - rest;
              dg2 += 2 * dg1;
              rest = (d2 % 11);
              if (rest < 2) {
                dg2 = 0;
              } else {
                dg2 = 11 - rest;

                nDigVerific =
                    str.toString().substring(str.length - 2, str.length);
              }
              nDigResult = "" + dg1.toString() + "" + dg2.toString();
              return nDigVerific == nDigResult;
            } catch (error) {
              print("Erro !" + error.toString());
              return false;
            }
          } else {
            return false;
          }
        } else {
          return false;
        }
      }
    } else {
      return false;
    }
  }
}
