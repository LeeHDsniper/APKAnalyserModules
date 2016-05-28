.class public Lcom/google/android/gms/internal/zzbh;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field private final zzrC:I

.field private final zzrD:I

.field private final zzrE:I

.field private final zzrF:Lcom/google/android/gms/internal/zzbm;

.field private zzrG:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private zzrH:I

.field private zzrI:I

.field private zzrJ:I

.field private zzrK:I

.field private zzrL:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIII)V
    .registers 7

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrG:Ljava/util/ArrayList;

    iput v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    iput v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrI:I

    iput v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrL:Ljava/lang/String;

    iput p1, p0, Lcom/google/android/gms/internal/zzbh;->zzrC:I

    iput p2, p0, Lcom/google/android/gms/internal/zzbh;->zzrD:I

    iput p3, p0, Lcom/google/android/gms/internal/zzbh;->zzrE:I

    new-instance v0, Lcom/google/android/gms/internal/zzbm;

    invoke-direct {v0, p4}, Lcom/google/android/gms/internal/zzbm;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrF:Lcom/google/android/gms/internal/zzbm;

    return-void
.end method

.method private zza(Ljava/util/ArrayList;I)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, ""

    :cond_8
    :goto_8
    return-object v0

    :cond_9
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v0, 0x20

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-le v0, p2, :cond_12

    :cond_2c
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, p2, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method private zzx(Ljava/lang/String;)V
    .registers 5

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrE:I

    if-ge v0, v1, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrG:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v0, v2

    iput v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    monitor-exit v1

    goto :goto_a

    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_e .. :try_end_20} :catchall_1e

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    instance-of v2, p1, Lcom/google/android/gms/internal/zzbh;

    if-nez v2, :cond_7

    .end local p1    # "obj":Ljava/lang/Object;
    :cond_6
    :goto_6
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_7
    if-ne p1, p0, :cond_b

    move v0, v1

    goto :goto_6

    :cond_b
    check-cast p1, Lcom/google/android/gms/internal/zzbh;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbh;->zzcm()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbh;->zzcm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbh;->zzcm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6
.end method

.method public getScore()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbh;->zzcm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ActivityContent fetchId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrI:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " score:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " total_length:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n text: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrG:Ljava/util/ArrayList;

    const/16 v2, 0xc8

    invoke-direct {p0, v1, v2}, Lcom/google/android/gms/internal/zzbh;->zza(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n signture: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method zza(II)I
    .registers 5

    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrC:I

    mul-int/2addr v0, p1

    iget v1, p0, Lcom/google/android/gms/internal/zzbh;->zzrD:I

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    return v0
.end method

.method public zzcl()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_8
    monitor-exit v1

    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_8

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public zzcm()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrL:Ljava/lang/String;

    return-object v0
.end method

.method public zzcn()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    add-int/lit8 v0, v0, -0x64

    iput v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzco()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzcp()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzcq()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    iget v2, p0, Lcom/google/android/gms/internal/zzbh;->zzrI:I

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzbh;->zza(II)I

    move-result v0

    iget v2, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    if-le v0, v2, :cond_1b

    iput v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrK:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrF:Lcom/google/android/gms/internal/zzbm;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbh;->zzrG:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzbm;->zza(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrL:Ljava/lang/String;

    :cond_1b
    monitor-exit v1

    return-void

    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method zzcr()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrH:I

    return v0
.end method

.method public zzg(I)V
    .registers 2

    iput p1, p0, Lcom/google/android/gms/internal/zzbh;->zzrI:I

    return-void
.end method

.method public zzv(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbh;->zzx(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_6
    iget v0, p0, Lcom/google/android/gms/internal/zzbh;->zzrJ:I

    if-gez v0, :cond_f

    const-string v0, "ActivityContent: negative number of WebViews."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_f
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzbh;->zzcq()V

    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_6 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public zzw(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzbh;->zzx(Ljava/lang/String;)V

    return-void
.end method
