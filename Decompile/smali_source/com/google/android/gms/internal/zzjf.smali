.class public Lcom/google/android/gms/internal/zzjf;
.super Lcom/google/android/gms/common/internal/zzj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzj",
        "<",
        "Lcom/google/android/gms/internal/zzjc;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 13

    const/16 v3, 0x13

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/zzj;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method


# virtual methods
.method protected synthetic zzV(Landroid/os/IBinder;)Landroid/os/IInterface;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzjf;->zzah(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjc;

    move-result-object v0

    return-object v0
.end method

.method protected zzah(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjc;
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzjc$zza;->zzaf(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjc;

    move-result-object v0

    return-object v0
.end method

.method protected zzfA()Ljava/lang/String;
    .registers 2

    const-string v0, "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE"

    return-object v0
.end method

.method protected zzfB()Ljava/lang/String;
    .registers 2

    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch"

    return-object v0
.end method

.method public zzlg()Lcom/google/android/gms/internal/zzjc;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzjf;->zzoA()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjc;

    return-object v0
.end method
