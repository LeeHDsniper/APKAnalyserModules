.class public final Lcom/google/android/gms/analytics/internal/zzy$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/internal/zzy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final zzNP:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field private final zzNQ:Lcom/google/android/gms/internal/zzkq;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkq",
            "<TV;>;"
        }
    .end annotation
.end field

.field private zzNR:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzkq",
            "<TV;>;TV;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNQ:Lcom/google/android/gms/internal/zzkq;

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNP:Ljava/lang/Object;

    return-void
.end method

.method static zza(Ljava/lang/String;F)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    invoke-static {p0, p1, p1}, Lcom/google/android/gms/analytics/internal/zzy$zza;->zza(Ljava/lang/String;FF)Lcom/google/android/gms/analytics/internal/zzy$zza;

    move-result-object v0

    return-object v0
.end method

.method static zza(Ljava/lang/String;FF)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzkq;->zza(Ljava/lang/String;Ljava/lang/Float;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzy$zza;-><init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V

    return-object v0
.end method

.method static zza(Ljava/lang/String;II)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzkq;->zza(Ljava/lang/String;Ljava/lang/Integer;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzy$zza;-><init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V

    return-object v0
.end method

.method static zza(Ljava/lang/String;JJ)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "JJ)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzkq;->zza(Ljava/lang/String;Ljava/lang/Long;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzy$zza;-><init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V

    return-object v0
.end method

.method static zza(Ljava/lang/String;ZZ)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-static {p0, p2}, Lcom/google/android/gms/internal/zzkq;->zzg(Ljava/lang/String;Z)Lcom/google/android/gms/internal/zzkq;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzy$zza;-><init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V

    return-object v0
.end method

.method static zzc(Ljava/lang/String;J)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-static {p0, p1, p2, p1, p2}, Lcom/google/android/gms/analytics/internal/zzy$zza;->zza(Ljava/lang/String;JJ)Lcom/google/android/gms/analytics/internal/zzy$zza;

    move-result-object v0

    return-object v0
.end method

.method static zzd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-static {p0, p2}, Lcom/google/android/gms/internal/zzkq;->zzu(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/zzkq;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/analytics/internal/zzy$zza;-><init>(Lcom/google/android/gms/internal/zzkq;Ljava/lang/Object;)V

    return-object v0
.end method

.method static zzd(Ljava/lang/String;Z)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    invoke-static {p0, p1, p1}, Lcom/google/android/gms/analytics/internal/zzy$zza;->zza(Ljava/lang/String;ZZ)Lcom/google/android/gms/analytics/internal/zzy$zza;

    move-result-object v0

    return-object v0
.end method

.method static zze(Ljava/lang/String;I)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    invoke-static {p0, p1, p1}, Lcom/google/android/gms/analytics/internal/zzy$zza;->zza(Ljava/lang/String;II)Lcom/google/android/gms/analytics/internal/zzy$zza;

    move-result-object v0

    return-object v0
.end method

.method static zzn(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/internal/zzy$zza;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/analytics/internal/zzy$zza",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p0, p1, p1}, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/internal/zzy$zza;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNR:Ljava/lang/Object;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNR:Ljava/lang/Object;

    :goto_6
    return-object v0

    :cond_7
    sget-boolean v0, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-eqz v0, :cond_18

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNQ:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->zznN()Ljava/lang/Object;

    move-result-object v0

    goto :goto_6

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzy$zza;->zzNP:Ljava/lang/Object;

    goto :goto_6
.end method
