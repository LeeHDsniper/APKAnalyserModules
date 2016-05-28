.class public Lcom/google/android/gms/analytics/internal/zzk;
.super Lcom/google/android/gms/analytics/internal/zzd;


# instance fields
.field private final zzMm:Lcom/google/android/gms/internal/zzok;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    new-instance v0, Lcom/google/android/gms/internal/zzok;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzok;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzk;->zzMm:Lcom/google/android/gms/internal/zzok;

    return-void
.end method


# virtual methods
.method protected zzhB()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzk;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzof;->zzxu()Lcom/google/android/gms/internal/zzok;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzk;->zzMm:Lcom/google/android/gms/internal/zzok;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzok;->zza(Lcom/google/android/gms/internal/zzok;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzk;->zzhw()V

    return-void
.end method

.method public zzhw()V
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzk;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzjZ()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_f

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzk;->zzMm:Lcom/google/android/gms/internal/zzok;

    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/zzok;->setAppName(Ljava/lang/String;)V

    :cond_f
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkb()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1a

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzk;->zzMm:Lcom/google/android/gms/internal/zzok;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzok;->setAppVersion(Ljava/lang/String;)V

    :cond_1a
    return-void
.end method

.method public zziL()Lcom/google/android/gms/internal/zzok;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzk;->zzio()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzk;->zzMm:Lcom/google/android/gms/internal/zzok;

    return-object v0
.end method
