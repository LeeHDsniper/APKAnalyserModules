.class Lcom/google/android/gms/analytics/internal/zzz$zza;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/internal/zzq$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/internal/zzz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/analytics/internal/zzq$zza",
        "<",
        "Lcom/google/android/gms/analytics/internal/zzaa;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzLy:Lcom/google/android/gms/analytics/internal/zzf;

.field private final zzNS:Lcom/google/android/gms/analytics/internal/zzaa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaa;

    invoke-direct {v0}, Lcom/google/android/gms/analytics/internal/zzaa;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    return-void
.end method


# virtual methods
.method public zzc(Ljava/lang/String;Z)V
    .registers 5

    const-string v0, "ga_dryRun"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    if-eqz p2, :cond_10

    const/4 v0, 0x1

    :goto_d
    iput v0, v1, Lcom/google/android/gms/analytics/internal/zzaa;->zzNX:I

    :goto_f
    return-void

    :cond_10
    const/4 v0, 0x0

    goto :goto_d

    :cond_12
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Bool xml configuration name not recognized"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_f
.end method

.method public zzd(Ljava/lang/String;I)V
    .registers 5

    const-string v0, "ga_dispatchPeriod"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    iput p2, v0, Lcom/google/android/gms/analytics/internal/zzaa;->zzNW:I

    :goto_c
    return-void

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Int xml configuration name not recognized"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_c
.end method

.method public zzjX()Lcom/google/android/gms/analytics/internal/zzaa;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    return-object v0
.end method

.method public synthetic zzjj()Lcom/google/android/gms/analytics/internal/zzp;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzjX()Lcom/google/android/gms/analytics/internal/zzaa;

    move-result-object v0

    return-object v0
.end method

.method public zzl(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public zzm(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    const-string v0, "ga_appName"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    iput-object p2, v0, Lcom/google/android/gms/analytics/internal/zzaa;->zzNT:Ljava/lang/String;

    :goto_c
    return-void

    :cond_d
    const-string v0, "ga_appVersion"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    iput-object p2, v0, Lcom/google/android/gms/analytics/internal/zzaa;->zzNU:Ljava/lang/String;

    goto :goto_c

    :cond_1a
    const-string v0, "ga_logLevel"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzNS:Lcom/google/android/gms/analytics/internal/zzaa;

    iput-object p2, v0, Lcom/google/android/gms/analytics/internal/zzaa;->zzNV:Ljava/lang/String;

    goto :goto_c

    :cond_27
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzz$zza;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "String xml configuration name not recognized"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_c
.end method
