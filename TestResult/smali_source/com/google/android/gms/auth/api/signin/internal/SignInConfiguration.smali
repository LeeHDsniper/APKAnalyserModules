.class public final Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final versionCode:I

.field private final zzRT:Ljava/lang/String;

.field private zzRU:Ljava/lang/String;

.field private zzRV:Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;

.field private zzRW:Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;

.field private zzRX:Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;

.field private zzRY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/auth/api/signin/internal/zze;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/signin/internal/zze;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;Ljava/lang/String;)V
    .registers 9
    .param p1, "versionCode"    # I
    .param p2, "consumerPkgName"    # Ljava/lang/String;
    .param p3, "serverClientId"    # Ljava/lang/String;
    .param p4, "emailConfig"    # Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;
    .param p5, "googleConfig"    # Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;
    .param p6, "facebookConfig"    # Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;
    .param p7, "apiKey"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->versionCode:I

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRT:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRU:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRV:Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;

    iput-object p5, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRW:Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;

    iput-object p6, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRX:Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;

    iput-object p7, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRY:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/auth/api/signin/internal/zze;->zza(Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzlF()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRT:Ljava/lang/String;

    return-object v0
.end method

.method public zzlG()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRU:Ljava/lang/String;

    return-object v0
.end method

.method public zzlH()Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRV:Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;

    return-object v0
.end method

.method public zzlI()Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRW:Lcom/google/android/gms/auth/api/signin/GoogleSignInConfig;

    return-object v0
.end method

.method public zzlJ()Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRX:Lcom/google/android/gms/auth/api/signin/FacebookSignInConfig;

    return-object v0
.end method

.method public zzlK()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/SignInConfiguration;->zzRY:Ljava/lang/String;

    return-object v0
.end method
