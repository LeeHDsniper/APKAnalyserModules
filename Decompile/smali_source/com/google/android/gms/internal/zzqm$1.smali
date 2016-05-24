.class final Lcom/google/android/gms/internal/zzqm$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzql;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzt([B)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    if-nez p1, :cond_a

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "Cannot parse a null byte[]"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    array-length v0, p1

    if-nez v0, :cond_15

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "Cannot parse a 0 length byte[]"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :try_start_15
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzeN(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzc;

    move-result-object v0

    if-eqz v0, :cond_25

    const-string v1, "The container was successfully parsed from the resource"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_25} :catch_26
    .catch Lcom/google/android/gms/internal/zzqp$zzg; {:try_start_15 .. :try_end_25} :catch_2f

    :cond_25
    return-object v0

    :catch_26
    move-exception v0

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "The resource data is corrupted. The container cannot be extracted from the binary data"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_2f
    move-exception v0

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "The resource data is invalid. The container cannot be extracted from the binary data"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0
.end method
