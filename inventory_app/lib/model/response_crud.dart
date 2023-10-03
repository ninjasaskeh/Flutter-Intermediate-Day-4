class ResponseCrud {
    final bool sukses;
    final String pesan;
    int? lastId;

    ResponseCrud({
        required this.sukses,
        required this.pesan,
        this.lastId,
    });

    factory ResponseCrud.fromJson(Map<String, dynamic> json) => ResponseCrud(
        sukses: json["sukses"],
        pesan: json["pesan"],
        lastId: json["last_id"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "sukses": sukses,
        "pesan": pesan,
        "last_id": lastId,
    };
}
