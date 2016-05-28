.class public Lcom/google/android/gms/internal/zzqi;
.super Ljava/lang/Object;


# instance fields
.field private final zzaOS:Ljava/lang/String;

.field private final zzaRq:Ljava/lang/String;

.field private final zzaTv:Ljava/lang/Integer;

.field private final zzaTw:Ljava/lang/String;

.field private final zzaTx:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Z)V
    .registers 11

    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqi;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;ZLjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p5}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqi;->zzaOS:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqi;->zzaTv:Ljava/lang/Integer;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqi;->zzaTw:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/google/android/gms/internal/zzqi;->zzaTx:Z

    iput-object p5, p0, Lcom/google/android/gms/internal/zzqi;->zzaRq:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getContainerId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaOS:Ljava/lang/String;

    return-object v0
.end method

.method public zzBp()Ljava/lang/Integer;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaTv:Ljava/lang/Integer;

    return-object v0
.end method

.method public zzBq()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaTw:Ljava/lang/String;

    return-object v0
.end method

.method public zzBr()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaTw:Ljava/lang/String;

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqi;->zzaTw:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqi;->zzaOS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1f
    return-object v0

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaOS:Ljava/lang/String;

    goto :goto_1f
.end method

.method public zzBs()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaTx:Z

    return v0
.end method

.method public zzBt()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqi;->zzaRq:Ljava/lang/String;

    return-object v0
.end method
