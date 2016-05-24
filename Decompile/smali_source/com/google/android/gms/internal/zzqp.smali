.class public Lcom/google/android/gms/internal/zzqp;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqp$1;,
        Lcom/google/android/gms/internal/zzqp$zzc;,
        Lcom/google/android/gms/internal/zzqp$zzd;,
        Lcom/google/android/gms/internal/zzqp$zze;,
        Lcom/google/android/gms/internal/zzqp$zzf;,
        Lcom/google/android/gms/internal/zzqp$zza;,
        Lcom/google/android/gms/internal/zzqp$zzb;,
        Lcom/google/android/gms/internal/zzqp$zzg;
    }
.end annotation


# direct methods
.method public static zzc(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v0, v0, [B

    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_c

    return-void

    :cond_c
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4
.end method

.method public static zzo(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 3

    new-instance v1, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzag$zza;-><init>()V

    iget v0, p0, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iput v0, v1, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zzjd:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, v1, Lcom/google/android/gms/internal/zzag$zza;->zzjd:[I

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    if-eqz v0, :cond_1b

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    iput-boolean v0, v1, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    :cond_1b
    return-object v1
.end method
