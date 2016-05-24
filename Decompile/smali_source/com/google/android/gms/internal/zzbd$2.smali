.class Lcom/google/android/gms/internal/zzbd$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzbd;->zza(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzru:Ljava/lang/String;

.field final synthetic zzrw:Lcom/google/android/gms/internal/zzbd;

.field final synthetic zzrx:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbd;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbd$2;->zzrw:Lcom/google/android/gms/internal/zzbd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbd$2;->zzru:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbd$2;->zzrx:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbd$2;->zzrw:Lcom/google/android/gms/internal/zzbd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzbd;->zza(Lcom/google/android/gms/internal/zzbd;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbd$2;->zzru:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbd$2;->zzrx:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzip;->zza(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
