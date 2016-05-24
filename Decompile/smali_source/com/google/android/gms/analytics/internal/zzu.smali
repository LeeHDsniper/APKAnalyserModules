.class public Lcom/google/android/gms/analytics/internal/zzu;
.super Lcom/google/android/gms/analytics/internal/zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-void
.end method


# virtual methods
.method protected zzhB()V
    .registers 1

    return-void
.end method

.method public zzjS()Lcom/google/android/gms/internal/zzom;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzu;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzu;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzof;->zzxv()Lcom/google/android/gms/internal/zzom;

    move-result-object v0

    return-object v0
.end method

.method public zzjT()Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzu;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzu;->zzjS()Lcom/google/android/gms/internal/zzom;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzom;->zzxI()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzom;->zzxJ()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
