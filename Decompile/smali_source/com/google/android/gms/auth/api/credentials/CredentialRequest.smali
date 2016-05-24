.class public final Lcom/google/android/gms/auth/api/credentials/CredentialRequest;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/auth/api/credentials/CredentialRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field private final zzRj:Z

.field private final zzRk:[Ljava/lang/String;

.field private final zzRl:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

.field private final zzRm:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/auth/api/credentials/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/credentials/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IZ[Ljava/lang/String;Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;)V
    .registers 7
    .param p1, "version"    # I
    .param p2, "supportsPasswordLogin"    # Z
    .param p3, "accountTypes"    # [Ljava/lang/String;
    .param p4, "credentialPickerConfig"    # Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;
    .param p5, "credentialHintPickerConfig"    # Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->mVersionCode:I

    iput-boolean p2, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRj:Z

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRk:[Ljava/lang/String;

    if-nez p4, :cond_1a

    new-instance v0, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;->build()Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    move-result-object p4

    .end local p4    # "credentialPickerConfig":Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;
    :cond_1a
    iput-object p4, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRl:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    if-nez p5, :cond_27

    new-instance v0, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig$Builder;->build()Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    move-result-object p5

    .end local p5    # "credentialHintPickerConfig":Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;
    :cond_27
    iput-object p5, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRm:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getAccountTypes()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRk:[Ljava/lang/String;

    return-object v0
.end method

.method public getCredentialHintPickerConfig()Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRm:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    return-object v0
.end method

.method public getCredentialPickerConfig()Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRl:Lcom/google/android/gms/auth/api/credentials/CredentialPickerConfig;

    return-object v0
.end method

.method public getSupportsPasswordLogin()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest;->zzRj:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/auth/api/credentials/zzc;->zza(Lcom/google/android/gms/auth/api/credentials/CredentialRequest;Landroid/os/Parcel;I)V

    return-void
.end method
