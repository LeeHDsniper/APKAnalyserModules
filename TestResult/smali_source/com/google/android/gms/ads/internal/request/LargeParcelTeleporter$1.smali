.class Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzf([B)Landroid/os/ParcelFileDescriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzEr:Ljava/io/OutputStream;

.field final synthetic zzEs:[B

.field final synthetic zzEt:Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;Ljava/io/OutputStream;[B)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEt:Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEr:Ljava/io/OutputStream;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEs:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    new-instance v1, Ljava/io/DataOutputStream;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEr:Ljava/io/OutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEs:[B

    array-length v0, v0

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;->zzEs:[B

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_12} :catch_16
    .catchall {:try_start_7 .. :try_end_12} :catchall_28

    invoke-static {v1}, Lcom/google/android/gms/internal/zzlr;->zzb(Ljava/io/Closeable;)V

    :goto_15
    return-void

    :catch_16
    move-exception v0

    :try_start_17
    const-string v2, "Error transporting the ad response"

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/internal/zzhl;->zzc(Ljava/lang/Throwable;Z)V
    :try_end_24
    .catchall {:try_start_17 .. :try_end_24} :catchall_28

    invoke-static {v1}, Lcom/google/android/gms/internal/zzlr;->zzb(Ljava/io/Closeable;)V

    goto :goto_15

    :catchall_28
    move-exception v0

    invoke-static {v1}, Lcom/google/android/gms/internal/zzlr;->zzb(Ljava/io/Closeable;)V

    throw v0
.end method
