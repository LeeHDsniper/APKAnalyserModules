.class public abstract Lcom/google/android/gms/internal/zzoe;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/android/gms/internal/zzoe;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final zzaIa:Lcom/google/android/gms/internal/zzof;

.field protected final zzaIb:Lcom/google/android/gms/internal/zzob;

.field private final zzaIc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzoc;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/zzof;Lcom/google/android/gms/internal/zzlm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoe;->zzaIa:Lcom/google/android/gms/internal/zzof;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIc:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzob;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/internal/zzob;-><init>(Lcom/google/android/gms/internal/zzoe;Lcom/google/android/gms/internal/zzlm;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzob;->zzxr()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIb:Lcom/google/android/gms/internal/zzob;

    return-void
.end method


# virtual methods
.method protected zza(Lcom/google/android/gms/internal/zzob;)V
    .registers 2

    return-void
.end method

.method protected zzd(Lcom/google/android/gms/internal/zzob;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIc:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzoc;

    invoke-interface {v0, p0, p1}, Lcom/google/android/gms/internal/zzoc;->zza(Lcom/google/android/gms/internal/zzoe;Lcom/google/android/gms/internal/zzob;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public zzhq()Lcom/google/android/gms/internal/zzob;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIb:Lcom/google/android/gms/internal/zzob;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzob;->zzxh()Lcom/google/android/gms/internal/zzob;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzoe;->zzd(Lcom/google/android/gms/internal/zzob;)V

    return-object v0
.end method

.method protected zzxp()Lcom/google/android/gms/internal/zzof;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIa:Lcom/google/android/gms/internal/zzof;

    return-object v0
.end method

.method public zzxs()Lcom/google/android/gms/internal/zzob;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIb:Lcom/google/android/gms/internal/zzob;

    return-object v0
.end method

.method public zzxt()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzoh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoe;->zzaIb:Lcom/google/android/gms/internal/zzob;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzob;->zzxj()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
