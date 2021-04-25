class Produto {
  String nome, img, descricao;
  double preco;

  Produto({
    this.img,
    this.nome,
    this.preco,
    this.descricao,
  });

  Produto.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    img = json['img'];
    preco = json['preco'];
    descricao = json['descricao'];
  }
}
