.class public Lcom/google/android/gms/signin/GoogleSignInAccount;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/signin/GoogleSignInAccount;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final versionCode:I

.field private zzRn:Ljava/lang/String;

.field private zzaNX:Ljava/lang/String;

.field private zzaNY:Landroid/net/Uri;

.field private zzahh:Ljava/lang/String;

.field private zzwj:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/signin/zza;

    invoke-direct {v0}, Lcom/google/android/gms/signin/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/signin/GoogleSignInAccount;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)V
    .registers 8
    .param p1, "versionCode"    # I
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "idToken"    # Ljava/lang/String;
    .param p4, "email"    # Ljava/lang/String;
    .param p5, "displayName"    # Ljava/lang/String;
    .param p6, "photoUrl"    # Landroid/net/Uri;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->versionCode:I

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzwj:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzRn:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzaNX:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzahh:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzaNY:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzahh:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzaNX:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzwj:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/signin/zza;->zza(Lcom/google/android/gms/signin/GoogleSignInAccount;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzlv()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzRn:Ljava/lang/String;

    return-object v0
.end method

.method public zzzm()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/GoogleSignInAccount;->zzaNY:Landroid/net/Uri;

    return-object v0
.end method
