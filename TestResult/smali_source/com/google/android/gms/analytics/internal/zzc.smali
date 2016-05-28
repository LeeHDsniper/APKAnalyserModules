.class public Lcom/google/android/gms/analytics/internal/zzc;
.super Ljava/lang/Object;


# instance fields
.field private final zzLy:Lcom/google/android/gms/analytics/internal/zzf;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    return-void
.end method

.method private zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 12

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    if-eqz v1, :cond_b

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzir()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    :cond_b
    if-eqz v0, :cond_16

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_15
    :goto_15
    return-void

    :cond_16
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-static {p2, p3, p4, p5}, Lcom/google/android/gms/analytics/internal/zzc;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    goto :goto_15
.end method

.method protected static zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 10

    if-nez p0, :cond_4

    const-string p0, ""

    :cond_4
    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zzc;->zzi(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Lcom/google/android/gms/analytics/internal/zzc;->zzi(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p3}, Lcom/google/android/gms/analytics/internal/zzc;->zzi(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_22

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    :cond_22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_30

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    :cond_30
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3e

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    :cond_3e
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4c

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    :cond_4c
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static zzi(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_5

    const-string p0, ""

    :goto_4
    return-object p0

    :cond_5
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_c

    check-cast p0, Ljava/lang/String;

    goto :goto_4

    :cond_c
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1b

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne p0, v0, :cond_18

    const-string v0, "true"

    :goto_16
    move-object p0, v0

    goto :goto_4

    :cond_18
    const-string v0, "false"

    goto :goto_16

    :cond_1b
    instance-of v0, p0, Ljava/lang/Throwable;

    if-eqz v0, :cond_26

    check-cast p0, Ljava/lang/Throwable;

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_26
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4
.end method


# virtual methods
.method protected getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public zza(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x2

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zza(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    const/4 v1, 0x2

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zza(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    const/4 v1, 0x3

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzaY(Ljava/lang/String;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v1, 0x2

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzaZ(Ljava/lang/String;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x3

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    const/4 v1, 0x3

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    const/4 v1, 0x5

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzba(Ljava/lang/String;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v1, 0x4

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzbb(Ljava/lang/String;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v1, 0x5

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzbc(Ljava/lang/String;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v1, 0x6

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzc(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x4

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    const/4 v1, 0x5

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzd(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x5

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    const/4 v1, 0x6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public zze(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x6

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/analytics/internal/zzc;->zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method protected zzhA()Lcom/google/android/gms/analytics/internal/zzan;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v0

    return-object v0
.end method

.method public zzhu()Lcom/google/android/gms/analytics/GoogleAnalytics;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzis()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    return-object v0
.end method

.method protected zzhz()Lcom/google/android/gms/analytics/internal/zzb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    return-object v0
.end method

.method public zzia()Lcom/google/android/gms/analytics/internal/zzf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    return-object v0
.end method

.method protected zzib()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzc;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call only supported on the client side"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    return-void
.end method

.method protected zzic()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzic()V

    return-void
.end method

.method protected zzid()Lcom/google/android/gms/internal/zzlm;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    return-object v0
.end method

.method protected zzie()Lcom/google/android/gms/analytics/internal/zzaf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    return-object v0
.end method

.method protected zzif()Lcom/google/android/gms/analytics/internal/zzr;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    return-object v0
.end method

.method protected zzig()Lcom/google/android/gms/internal/zzof;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    return-object v0
.end method

.method protected zzih()Lcom/google/android/gms/analytics/internal/zzv;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzih()Lcom/google/android/gms/analytics/internal/zzv;

    move-result-object v0

    return-object v0
.end method

.method protected zzii()Lcom/google/android/gms/analytics/internal/zzai;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    return-object v0
.end method

.method protected zzij()Lcom/google/android/gms/analytics/internal/zzn;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zziv()Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v0

    return-object v0
.end method

.method protected zzik()Lcom/google/android/gms/analytics/internal/zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zziu()Lcom/google/android/gms/analytics/internal/zza;

    move-result-object v0

    return-object v0
.end method

.method protected zzil()Lcom/google/android/gms/analytics/internal/zzk;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzil()Lcom/google/android/gms/analytics/internal/zzk;

    move-result-object v0

    return-object v0
.end method

.method protected zzim()Lcom/google/android/gms/analytics/internal/zzu;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzc;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzim()Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v0

    return-object v0
.end method

.method public zzin()Z
    .registers 3

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method
