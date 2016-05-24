.class public final Lcom/google/android/gms/internal/zzol;
.super Lcom/google/android/gms/internal/zzod;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzod",
        "<",
        "Lcom/google/android/gms/internal/zzol;",
        ">;"
    }
.end annotation


# instance fields
.field private mName:Ljava/lang/String;

.field private zzaDI:Ljava/lang/String;

.field private zzaIu:Ljava/lang/String;

.field private zzaIv:Ljava/lang/String;

.field private zzaIw:Ljava/lang/String;

.field private zzaIx:Ljava/lang/String;

.field private zzaIy:Ljava/lang/String;

.field private zzaIz:Ljava/lang/String;

.field private zzvx:Ljava/lang/String;

.field private zzwj:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzod;-><init>()V

    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzvx:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzwj:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaDI:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->mName:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "name"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->mName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "source"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaDI:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "medium"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIu:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "keyword"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIv:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "content"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzvx:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "id"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzwj:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "adNetworkId"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIw:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "gclid"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIx:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "dclid"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIy:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "aclid"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzol;->zzaIz:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzol;->zzA(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzod;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzol;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzol;->zza(Lcom/google/android/gms/internal/zzol;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzol;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->mName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->setName(Ljava/lang/String;)V

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaDI:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaDI:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdI(Ljava/lang/String;)V

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIu:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIu:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdJ(Ljava/lang/String;)V

    :cond_27
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIv:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_34

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIv:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdK(Ljava/lang/String;)V

    :cond_34
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzvx:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_41

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzvx:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdL(Ljava/lang/String;)V

    :cond_41
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzwj:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4e

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzwj:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdM(Ljava/lang/String;)V

    :cond_4e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIw:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIw:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdN(Ljava/lang/String;)V

    :cond_5b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIx:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_68

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIx:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdO(Ljava/lang/String;)V

    :cond_68
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIy:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_75

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIy:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdP(Ljava/lang/String;)V

    :cond_75
    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIz:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_82

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIz:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzol;->zzdQ(Ljava/lang/String;)V

    :cond_82
    return-void
.end method

.method public zzdI(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaDI:Ljava/lang/String;

    return-void
.end method

.method public zzdJ(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIu:Ljava/lang/String;

    return-void
.end method

.method public zzdK(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIv:Ljava/lang/String;

    return-void
.end method

.method public zzdL(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzvx:Ljava/lang/String;

    return-void
.end method

.method public zzdM(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzwj:Ljava/lang/String;

    return-void
.end method

.method public zzdN(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIw:Ljava/lang/String;

    return-void
.end method

.method public zzdO(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIx:Ljava/lang/String;

    return-void
.end method

.method public zzdP(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIy:Ljava/lang/String;

    return-void
.end method

.method public zzdQ(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzol;->zzaIz:Ljava/lang/String;

    return-void
.end method

.method public zzxB()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIu:Ljava/lang/String;

    return-object v0
.end method

.method public zzxC()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIv:Ljava/lang/String;

    return-object v0
.end method

.method public zzxD()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIw:Ljava/lang/String;

    return-object v0
.end method

.method public zzxE()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIx:Ljava/lang/String;

    return-object v0
.end method

.method public zzxF()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIy:Ljava/lang/String;

    return-object v0
.end method

.method public zzxG()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzol;->zzaIz:Ljava/lang/String;

    return-object v0
.end method
