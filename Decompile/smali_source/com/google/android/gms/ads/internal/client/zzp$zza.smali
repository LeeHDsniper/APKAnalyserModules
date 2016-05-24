.class public abstract Lcom/google/android/gms/ads/internal/client/zzp$zza;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/google/android/gms/ads/internal/client/zzp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/internal/client/zzp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/client/zzp$zza$zza;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p0, p0, v0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static zzi(Landroid/os/IBinder;)Lcom/google/android/gms/ads/internal/client/zzp;
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/google/android/gms/ads/internal/client/zzp;

    if-eqz v1, :cond_13

    check-cast v0, Lcom/google/android/gms/ads/internal/client/zzp;

    goto :goto_3

    :cond_13
    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzp$zza$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/internal/client/zzp$zza$zza;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 9
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    sparse-switch p1, :sswitch_data_a2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    :goto_9
    return v0

    :sswitch_a
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    move v0, v1

    goto :goto_9

    :sswitch_11
    const-string v2, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zzbk()Lcom/google/android/gms/ads/internal/client/zzo;

    move-result-object v2

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz v2, :cond_23

    invoke-interface {v2}, Lcom/google/android/gms/ads/internal/client/zzo;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    :cond_23
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    move v0, v1

    goto :goto_9

    :sswitch_28
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/client/zzn$zza;->zzg(Landroid/os/IBinder;)Lcom/google/android/gms/ads/internal/client/zzn;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zzb(Lcom/google/android/gms/ads/internal/client/zzn;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v0, v1

    goto :goto_9

    :sswitch_3d
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzct$zza;->zzz(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzct;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zza(Lcom/google/android/gms/internal/zzct;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v0, v1

    goto :goto_9

    :sswitch_52
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzcu$zza;->zzA(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcu;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zza(Lcom/google/android/gms/internal/zzcu;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v0, v1

    goto :goto_9

    :sswitch_67
    const-string v0, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzcw$zza;->zzC(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcw;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzcv$zza;->zzB(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcv;

    move-result-object v3

    invoke-virtual {p0, v0, v2, v3}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzcw;Lcom/google/android/gms/internal/zzcv;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v0, v1

    goto :goto_9

    :sswitch_88
    const-string v2, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_99

    sget-object v0, Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;->CREATOR:Lcom/google/android/gms/ads/internal/formats/zzi;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/internal/formats/zzi;->zzf(Landroid/os/Parcel;)Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-result-object v0

    :cond_99
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/client/zzp$zza;->zza(Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v0, v1

    goto/16 :goto_9

    :sswitch_data_a2
    .sparse-switch
        0x1 -> :sswitch_11
        0x2 -> :sswitch_28
        0x3 -> :sswitch_3d
        0x4 -> :sswitch_52
        0x5 -> :sswitch_67
        0x6 -> :sswitch_88
        0x5f4e5446 -> :sswitch_a
    .end sparse-switch
.end method
