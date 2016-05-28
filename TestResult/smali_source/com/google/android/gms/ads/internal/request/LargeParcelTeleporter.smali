.class public final Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field zzEo:Landroid/os/ParcelFileDescriptor;

.field private zzEp:Landroid/os/Parcelable;

.field private zzEq:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/ads/internal/request/zzl;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/request/zzl;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/os/ParcelFileDescriptor;)V
    .registers 4
    .param p1, "versionCode"    # I
    .param p2, "parcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEp:Landroid/os/Parcelable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEq:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;)V
    .registers 3
    .param p1, "teleportee"    # Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->mVersionCode:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEp:Landroid/os/Parcelable;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEq:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    if-nez v0, :cond_1b

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_8
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEp:Landroid/os/Parcelable;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    invoke-virtual {v1}, Landroid/os/Parcel;->marshall()[B
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_1f

    move-result-object v0

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzf([B)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    :cond_1b
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/ads/internal/request/zzl;->zza(Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;Landroid/os/Parcel;I)V

    return-void

    :catchall_1f
    move-exception v0

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    throw v0
.end method

.method public zza(Landroid/os/Parcelable$Creator;)Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;",
            ">(",
            "Landroid/os/Parcelable$Creator",
            "<TT;>;)TT;"
        }
    .end annotation

    const/4 v4, 0x0

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEq:Z

    if-eqz v0, :cond_44

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    if-nez v0, :cond_10

    const-string v0, "File descriptor is empty, returning null."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->e(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_f
    return-object v0

    :cond_10
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v0, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEo:Landroid/os/ParcelFileDescriptor;

    invoke-direct {v0, v2}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_1c
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    new-array v0, v0, [B

    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {v1, v0, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_27} :catch_49
    .catchall {:try_start_1c .. :try_end_27} :catchall_52

    invoke-static {v1}, Lcom/google/android/gms/internal/zzlr;->zzb(Ljava/io/Closeable;)V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    const/4 v2, 0x0

    :try_start_2f
    array-length v3, v0

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Parcel;->unmarshall([BII)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    invoke-interface {p1, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEp:Landroid/os/Parcelable;
    :try_end_3f
    .catchall {:try_start_2f .. :try_end_3f} :catchall_57

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    iput-boolean v4, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEq:Z

    :cond_44
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;->zzEp:Landroid/os/Parcelable;

    check-cast v0, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;

    goto :goto_f

    :catch_49
    move-exception v0

    :try_start_4a
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Could not read from parcel file descriptor"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_52
    .catchall {:try_start_4a .. :try_end_52} :catchall_52

    :catchall_52
    move-exception v0

    invoke-static {v1}, Lcom/google/android/gms/internal/zzlr;->zzb(Ljava/io/Closeable;)V

    throw v0

    :catchall_57
    move-exception v0

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    throw v0
.end method

.method protected zzf([B)Landroid/os/ParcelFileDescriptor;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B)",
            "Landroid/os/ParcelFileDescriptor;"
        }
    .end annotation

    const/4 v3, 0x1

    :try_start_1
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v1, v0, v1

    new-instance v2, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    invoke-direct {v2, v1}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    new-instance v1, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;

    invoke-direct {v1, p0, v2, p1}, Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter$1;-><init>(Lcom/google/android/gms/ads/internal/request/LargeParcelTeleporter;Ljava/io/OutputStream;[B)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v1, 0x0

    aget-object v0, v0, v1
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1d} :catch_1e

    :goto_1d
    return-object v0

    :catch_1e
    move-exception v0

    const-string v1, "Error transporting the ad response"

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v1

    invoke-virtual {v1, v0, v3}, Lcom/google/android/gms/internal/zzhl;->zzc(Ljava/lang/Throwable;Z)V

    const/4 v0, 0x0

    goto :goto_1d
.end method
