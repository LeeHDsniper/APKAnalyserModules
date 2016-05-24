.class public abstract Lcom/google/android/gms/internal/zzrx;
.super Ljava/lang/Object;


# instance fields
.field protected volatile zzbcl:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzrx;->zzbcl:I

    return-void
.end method

.method public static final zza(Lcom/google/android/gms/internal/zzrx;[B)Lcom/google/android/gms/internal/zzrx;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzrx;",
            ">(TT;[B)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzrw;
        }
    .end annotation

    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/gms/internal/zzrx;->zzb(Lcom/google/android/gms/internal/zzrx;[BII)Lcom/google/android/gms/internal/zzrx;

    move-result-object v0

    return-object v0
.end method

.method public static final zzb(Lcom/google/android/gms/internal/zzrx;[BII)Lcom/google/android/gms/internal/zzrx;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzrx;",
            ">(TT;[BII)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzrw;
        }
    .end annotation

    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/zzrp;->zza([BII)Lcom/google/android/gms/internal/zzrp;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzrx;->zzb(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzrx;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzrp;->zzli(I)V
    :try_end_b
    .catch Lcom/google/android/gms/internal/zzrw; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_e

    return-object p0

    :catch_c
    move-exception v0

    throw v0

    :catch_e
    move-exception v0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Reading from a byte array threw an IOException (should never happen)."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrx;->zzDm()Lcom/google/android/gms/internal/zzrx;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/internal/zzry;->zzg(Lcom/google/android/gms/internal/zzrx;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected zzB()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public zzDm()Lcom/google/android/gms/internal/zzrx;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzrx;

    return-object v0
.end method

.method public zzDw()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzrx;->zzbcl:I

    if-gez v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrx;->zzDx()I

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/zzrx;->zzbcl:I

    return v0
.end method

.method public zzDx()I
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzrx;->zzB()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzrx;->zzbcl:I

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzrq;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public abstract zzb(Lcom/google/android/gms/internal/zzrp;)Lcom/google/android/gms/internal/zzrx;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
