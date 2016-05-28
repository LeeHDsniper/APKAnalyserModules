.class public Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Result;
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/appdatasearch/GetRecentContextCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/appdatasearch/zzg;


# instance fields
.field final mVersionCode:I

.field public zzPv:Lcom/google/android/gms/common/api/Status;

.field public zzPw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/appdatasearch/UsageInfo;",
            ">;"
        }
    .end annotation
.end field

.field public zzPx:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/appdatasearch/zzg;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zzg;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->CREATOR:Lcom/google/android/gms/appdatasearch/zzg;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->mVersionCode:I

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/common/api/Status;Ljava/util/List;[Ljava/lang/String;)V
    .registers 5
    .param p1, "versionCode"    # I
    .param p2, "status"    # Lcom/google/android/gms/common/api/Status;
    .param p4, "topRunningPackages"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/common/api/Status;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/appdatasearch/UsageInfo;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, "usageInfo":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/appdatasearch/UsageInfo;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPv:Lcom/google/android/gms/common/api/Status;

    iput-object p3, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPw:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPx:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    sget-object v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->CREATOR:Lcom/google/android/gms/appdatasearch/zzg;

    const/4 v0, 0x0

    return v0
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPv:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->CREATOR:Lcom/google/android/gms/appdatasearch/zzg;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/appdatasearch/zzg;->zza(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;Landroid/os/Parcel;I)V

    return-void
.end method
